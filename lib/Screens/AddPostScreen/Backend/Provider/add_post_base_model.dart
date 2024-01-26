// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:barber_klipz_ui/Screens/ProfileScreen/Backend/Provider/profile_base_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:photofilters/photofilters.dart';
// ignore: depend_on_referenced_packages
import "package:http_parser/http_parser.dart";

import '../../../../Helpers/api_helpers.dart';
import '../../../../Resources/color_const.dart';
import '../../../../Utils/text_util.dart';
import '../../../../Utils/toast_util.dart';

final addPostBaseModel = ChangeNotifierProvider((ref) => AddPostBaseModel(ref));

class AddPostBaseModel extends ChangeNotifier {
  final Ref ref;
  AddPostBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextEditingController _caption = TextEditingController();
  String? _fileName;
  final List<Filter> _filters = presetFiltersList;
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  XFile? _pickedFile;
  bool _exclusiveContent = false;
  bool _exclusiveContentAgreement = false;
  final ApiHelper _apiHelper = ApiHelper();
  bool _serviceEnabled = true;
  LocationPermission? _permission;
  TextEditingController _locationController = TextEditingController();
  String? _currentAddress;
  Position? _currentPosition;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  TextEditingController get caption => _caption;
  String? get fileName => _fileName;
  List<Filter> get filters => _filters;
  ImagePicker get picker => _picker;
  File? get selectedImage => _selectedImage;
  XFile? get pickedFile => _pickedFile;
  bool get exclusiveContent => _exclusiveContent;
  bool get exclusiveContentAgreement => _exclusiveContentAgreement;
  ApiHelper get apiHelper => _apiHelper;
  bool get serviceEnabled => _serviceEnabled;
  LocationPermission? get permission => _permission;
  TextEditingController get locationController => _locationController;
  String? get currentAddress => _currentAddress;
  Position? get currentPosition => _currentPosition;

  //functions

  //functions

  void enableExclusiveContent(bool value) {
    _exclusiveContent = value;
    notifyListeners();
  }

  void enableExclusiveContentAgreement(bool value) {
    _exclusiveContentAgreement = value;
    notifyListeners();
  }

  Future getImage(context) async {
    _pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      _selectedImage = File(_pickedFile!.path);
      _fileName = basename(_selectedImage!.path);
      var image = img.decodeImage(await _selectedImage!.readAsBytes());
      image = img.copyResize(image!, width: 600);
      var imageFile = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhotoFilterSelector(
            appBarColor: kYellow,
            title: TextUtil.secondaryText(
              text: "Filter",
              color: kBlack,
              size: 18,
              fontWeight: FontWeight.w600,
            ),
            image: image!,
            filters: _filters,
            filename: _fileName!,
            loader: const Center(child: CircularProgressIndicator()),
            fit: BoxFit.contain,
          ),
        ),
      );
      if (imageFile != null && imageFile.containsKey('image_filtered')) {
        _selectedImage = imageFile['image_filtered'];
        notifyListeners();
      }
    }
  }

  Future<bool> handleLocationPermission(BuildContext context) async {
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (_serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();
      if (_permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (_permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> getCurrentPosition(BuildContext context) async {
    final hasPermission = await handleLocationPermission(context);
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      notifyListeners();
      _getAddressFromLatLng(_currentPosition!);
      _locationController.text = _currentAddress!;
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      _currentAddress =
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      notifyListeners();
    }).catchError((e) {
      debugPrint(e);
    });
  }

  //API calls

  Future<void> createImagePost(
      BuildContext context, ProfileBaseModel profileBaseModel) async {
    try {
      Loader.show(
        context,
        progressIndicator: const CircularProgressIndicator(
          color: kYellow,
        ),
      );
      notifyListeners();
      String fileName = _selectedImage!.path.split('/').last;
      FormData formData = FormData.fromMap({
        "caption": _caption.text,
        "media_type": "IMAGE",
        "media": await MultipartFile.fromFile(
          _selectedImage!.path,
          filename: fileName,
          contentType: MediaType(
            "image",
            'png,jpg,jpeg',
          ),
        ),
      });
      await _apiHelper
          .postData(context: context, data: formData, url: "post/create")
          .then((value) {
        Loader.hide();
        if (value != null) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          ToastUtil(context)
              .showSuccessToastNotification("Post created successfully");
          profileBaseModel.getAllUserPosts(context);
        }
      });
      notifyListeners();
    } catch (e) {
      Loader.hide();
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }
}
