// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Models/user_model.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Provider/splash_base_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import "package:http_parser/http_parser.dart";
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Utils/toast_util.dart';

final accountSettingsBaseModel =
    ChangeNotifierProvider((ref) => AccountSettingsBaseModel(ref));

class AccountSettingsBaseModel extends ChangeNotifier {
  final Ref ref;
  AccountSettingsBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  File? _profilePicture;
  File? _coverPhoto;
  String? _profileImage;
  String? _coverImage;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _website = TextEditingController();
  final TextEditingController _bio = TextEditingController();
  final TextEditingController _selectedDate = TextEditingController();
  final TextEditingController _newDate = TextEditingController();
  String? _defaultDate;
  final ImagePicker _imagePicker = ImagePicker();
  final ApiHelper _apiHelper = ApiHelper();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  File? get profilePicture => _profilePicture;
  File? get coverPhoto => _coverPhoto;
  String? get profileImage => _profileImage;
  String? get coverImage => _coverImage;
  TextEditingController get username => _username;
  TextEditingController get firstName => _firstName;
  TextEditingController get lastName => _lastName;
  TextEditingController get website => _website;
  TextEditingController get bio => _bio;
  TextEditingController get newDate => _newDate;
  TextEditingController get selectedDate => _selectedDate;
  String? get defaultDate => _defaultDate;
  ImagePicker get imagePicker => _imagePicker;
  ApiHelper get apiHelper => _apiHelper;

  //functions

  //selects profile picture of user from gallery
  Future<void> selectGalleryImage() async {
    try {
      XFile? picture =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (picture != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: picture.path,
          aspectRatio: const CropAspectRatio(
            ratioX: 1,
            ratioY: 1,
          ),
        );

        _profilePicture = File(croppedFile!.path);
      }
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  //selects profile picture of user from camera
  Future<void> selectCameraImage() async {
    try {
      XFile? picture = await _imagePicker.pickImage(source: ImageSource.camera);
      if (picture != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: picture.path,
          aspectRatio: const CropAspectRatio(
            ratioX: 1,
            ratioY: 1,
          ),
        );

        _profilePicture = File(croppedFile!.path);
      }
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  //selects cover photo of user from gallery
  Future<void> selectCoverGalleryImage() async {
    try {
      XFile? picture =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (picture != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: picture.path,
          aspectRatio: const CropAspectRatio(
            ratioX: 1,
            ratioY: 1,
          ),
        );

        _coverPhoto = File(croppedFile!.path);
      }
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  //selects cover photo of user from camera
  Future<void> selectCoverCameraImage() async {
    try {
      XFile? picture = await _imagePicker.pickImage(source: ImageSource.camera);
      if (picture != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: picture.path,
          aspectRatio: const CropAspectRatio(
            ratioX: 1,
            ratioY: 1,
          ),
        );

        _coverPhoto = File(croppedFile!.path);
      }
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  //sets the dob of user
  Future<void> changeDate(BuildContext context) async {
    final picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: kYellow,
            colorScheme: const ColorScheme.light(
              primary: kYellow,
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now().subtract(
        const Duration(days: 3650),
      ),
    );
    if (picked != null) {
      _newDate.text = "${picked.toLocal()}".split(' ')[0];
      notifyListeners();
    }
  }

  //functions

  //initialized the text form fields with initial value
  void initialize(UserModel user) {
    _username.text = user.user_name;
    _firstName.text = user.first_name ?? "";
    _lastName.text = user.last_name ?? "";
    _profileImage = user.profile_image ?? "";
    _coverImage = user.cover_image ?? "";
    if (user.birthday != null) {
      _selectedDate.text = DateFormat("yyyy-dd-MM")
          .format(DateTime.parse(user.birthday.toString()));
    } else {
      _selectedDate.text = '';
    }
    _defaultDate = user.birthday ?? "";
    _website.text = user.website ?? "";
    _bio.text = user.bio ?? "";
  }

  //API functions

  Future<void> updateProfile(
      BuildContext context, SplashScreenBaseModel userBaseModel) async {
    try {
      Loader.show(
        context,
        progressIndicator: const CircularProgressIndicator(
          color: kYellow,
        ),
      );
      notifyListeners();
      String? fileName1;
      String? fileName2;
      if (_profilePicture != null) {
        fileName1 = _profilePicture!.path.split('/').last;
      }
      if (_coverPhoto != null) {
        fileName2 = _coverPhoto!.path.split('/').last;
      }
      FormData formData = FormData.fromMap({
        if (_bio.text.isNotEmpty) "bio": _bio.text,
        if (_profilePicture != null && fileName1 != null)
          "profileImage": await MultipartFile.fromFile(
            _profilePicture!.path,
            filename: fileName1,
            contentType: MediaType(
              "image",
              'png,jpg,jpeg',
            ),
          ),
        if (_coverPhoto != null && fileName2 != null)
          "coverImage": await MultipartFile.fromFile(
            _coverPhoto!.path,
            filename: fileName2,
            contentType: MediaType(
              "image",
              'png,jpg,jpeg',
            ),
          ),
        if (_firstName.text.isNotEmpty) "first_name": _firstName.text,
        if (_lastName.text.isNotEmpty) "last_name": _lastName.text,
        if (_website.text.isNotEmpty) "website": _website.text,
        if (_defaultDate!.isNotEmpty) "birthday": _defaultDate,
      });

      await _apiHelper
          .patchData(
              context: context, data: formData, url: "user/update-profile")
          .then((value) {
        Loader.hide();
        if (value != null && value['data'] != null) {
          ToastUtil(context)
              .showSuccessToastNotification('Profile updated successfully');
          userBaseModel.updateDetails(value["data"]);
          Navigator.of(context).pop();
          FocusManager.instance.primaryFocus?.unfocus();
        }
        Loader.hide();
        notifyListeners();
      });
    } catch (e) {
      Loader.hide();
    }
  }
}
