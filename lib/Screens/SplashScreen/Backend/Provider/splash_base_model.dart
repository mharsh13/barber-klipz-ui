// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';

import '../../../../Utils/toast_util.dart';
import '../Models/user_model.dart';

final splashScreenBaseModel =
    ChangeNotifierProvider((ref) => SplashScreenBaseModel(ref));

class SplashScreenBaseModel extends ChangeNotifier {
  final Ref ref;
  SplashScreenBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final ApiHelper _apiHelper = ApiHelper();
  UserModel? _user;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  ApiHelper get apiHelper => _apiHelper;
  UserModel? get user => _user;

  Future<bool> getMe(BuildContext context) async {
    bool isLoggedIn = false;
    try {
      await _apiHelper.getData(context: context, url: "auth/me").then((value) {
        if (value != null) {
          isLoggedIn = true;
          _user = UserModel.fromMap(value["data"]);
        }
      });
      notifyListeners();
    } catch (e) {
      isLoggedIn = false;
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
    return isLoggedIn;
  }
}
