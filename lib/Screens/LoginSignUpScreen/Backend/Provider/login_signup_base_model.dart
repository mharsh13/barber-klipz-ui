import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginSignUpBaseModel =
    ChangeNotifierProvider((ref) => LoginSignUpBaseModel(ref));

class LoginSignUpBaseModel extends ChangeNotifier {
  final Ref ref;
  LoginSignUpBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  int _currentValue = 0;
  bool _privacyPolicy = false;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  int get currentValue => _currentValue;
  bool get privacyPolicy => _privacyPolicy;

  //functions

  //changes the value of the tab bar
  void setValue(value) {
    _currentValue = value;
    notifyListeners();
  }

  //sets the privacy policy
  void setPrivacyPolicy() {
    _privacyPolicy = !_privacyPolicy;
    notifyListeners();
  }
}
