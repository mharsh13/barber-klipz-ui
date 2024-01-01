import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';

import '../../../../Utils/toast_util.dart';

final splashScreenBaseModel =
    ChangeNotifierProvider((ref) => SplashScreenBaseModel(ref));

class SplashScreenBaseModel extends ChangeNotifier {
  final Ref ref;
  SplashScreenBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final ApiHelper _apiHelper = ApiHelper();

  //getters
  ScreenUtil get screenUtil => _screenUtil;

  Future<bool> getMe(BuildContext context) async {
    bool isLoggedIn = false;
    try {
      await _apiHelper.getData(context: context, url: "auth/me").then((value) {
        if (value != null) {
          print(value);
          isLoggedIn = true;
        }
      });
    } catch (e) {
      print(e);
      isLoggedIn = false;
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
    return isLoggedIn;
  }
}
