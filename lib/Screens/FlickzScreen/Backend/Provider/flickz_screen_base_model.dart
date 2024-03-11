import 'dart:io';

import 'package:barber_klipz_ui/Models/message_model.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Resources/color_const.dart';
import '../../../../Utils/toast_util.dart';
import '../../../ProfileScreen/Backend/Provider/profile_base_model.dart';

final flickzBaseModel =
    ChangeNotifierProvider((ref) => flickzScreenBaseModel(ref));

class flickzScreenBaseModel extends ChangeNotifier {
  final Ref ref;
  flickzScreenBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextEditingController _enterMessage = TextEditingController();
  final ApiHelper _apiHelper = ApiHelper();
  bool _loader = false;
  FilePickerResult? _flickz;
  final TextEditingController _caption = TextEditingController();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  TextEditingController get enterMessage => _enterMessage;
  bool get loader => _loader;
  FilePickerResult? get flickz => _flickz;
  TextEditingController get caption => _caption;

  //API functions

  //API calls

  // Future<void> createFlickz(
  //     BuildContext context, ProfileBaseModel profileBaseModel) async {
  //   try {
  //     Loader.show(
  //       context,
  //       progressIndicator: const CircularProgressIndicator(
  //         color: kYellow,
  //       ),
  //     );
  //     notifyListeners();
  //     String fileName = _flickz!.paths.split('/').last;
  //     FormData formData = FormData.fromMap({
  //       "caption": _caption.text,
  //       "media_type": "FLICKS",
  //       "media": await MultipartFile.fromFile(
  //         _selectedImage!.path,
  //         filename: fileName,
  //         contentType: MediaType(
  //           "image",
  //           'png,jpg,jpeg',
  //         ),
  //       ),
  //     });
  //     await _apiHelper
  //         .postData(context: context, data: formData, url: "post/create")
  //         .then((value) {
  //       Loader.hide();
  //       if (value != null) {
  //         Navigator.of(context).pop();
  //         Navigator.of(context).pop();
  //         Navigator.of(context).pop();
  //         ToastUtil(context)
  //             .showSuccessToastNotification("Post created successfully");
  //         profileBaseModel.getAllUserPosts(context);
  //       }
  //     });
  //     notifyListeners();
  //   } catch (e) {
  //     Loader.hide();
  //     ToastUtil(context).showErrorToastNotification("Something went wrong");
  //   }
  // }
}
