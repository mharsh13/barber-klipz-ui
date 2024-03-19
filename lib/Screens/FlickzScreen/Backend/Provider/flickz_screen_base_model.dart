import 'package:barber_klipz_ui/Screens/BottomNavigationBarScreen/Backend/Provider/bottom_navigation_bar_base_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  TextEditingController get enterMessage => _enterMessage;
  bool get loader => _loader;
  TextEditingController get caption => _caption;

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
        "caption": "Hiiiii",
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
