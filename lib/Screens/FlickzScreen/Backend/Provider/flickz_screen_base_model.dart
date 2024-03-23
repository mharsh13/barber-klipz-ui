import 'package:barber_klipz_ui/Screens/BottomNavigationBarScreen/Backend/Provider/bottom_navigation_bar_base_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Resources/color_const.dart';
import '../../../../Utils/toast_util.dart';
import '../../../ProfileScreen/Backend/Provider/profile_base_model.dart';

final flickzBaseModel =
    ChangeNotifierProvider((ref) => FlickzScreenBaseModel(ref));

class FlickzScreenBaseModel extends ChangeNotifier {
  final Ref ref;
  FlickzScreenBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextEditingController _enterMessage = TextEditingController();
  final ApiHelper _apiHelper = ApiHelper();
  final bool _loader = false;
  final TextEditingController _caption = TextEditingController();
  bool _serviceEnabled = true;
  LocationPermission? _permission;
  TextEditingController _locationController = TextEditingController();
  String? _currentAddress;
  Position? _currentPosition;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  TextEditingController get enterMessage => _enterMessage;
  bool get loader => _loader;
  TextEditingController get caption => _caption;
  bool get serviceEnabled => _serviceEnabled;
  LocationPermission? get permission => _permission;
  TextEditingController get locationController => _locationController;
  String? get currentAddress => _currentAddress;
  Position? get currentPosition => _currentPosition;

  //functions

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

  Future<void> createFlickz(
      BuildContext context,
      BottomNavigationBarBaseModel bottomBaseModel,
      ProfileBaseModel profileBaseModel) async {
    if (bottomBaseModel.mediaFile == null) {
      ToastUtil(context).showErrorToastNotification("Please select a video");
      return;
    }
    try {
      print(bottomBaseModel.mediaFile);
      Loader.show(
        context,
        progressIndicator: const CircularProgressIndicator(
          color: kYellow,
        ),
      );
      notifyListeners();
      String filename = bottomBaseModel.mediaFile!.path.split('/').last;
      FormData formData = FormData.fromMap({
        "caption": _caption.text,
        "media_type": "FLICKS",
        "media": await MultipartFile.fromFile(bottomBaseModel.mediaFile!.path,
            filename: filename),
      });

      await _apiHelper
          .postData(context: context, data: formData, url: "post/create")
          .then((value) {
        Loader.hide();
        if (value != null) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          // Navigator.of(context).pop();
          ToastUtil(context)
              .showSuccessToastNotification("Post created successfully");
          // profileBaseModel.getAllUserPosts(context);
        }
      });
      notifyListeners();
    } catch (e) {
      Loader.hide();
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }
}
