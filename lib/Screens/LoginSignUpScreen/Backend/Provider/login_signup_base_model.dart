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
  final TextEditingController _username = TextEditingController();
  final TextEditingController _mobileNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _loginUsername = TextEditingController();
  final TextEditingController _loginPassword = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  int get currentValue => _currentValue;
  bool get privacyPolicy => _privacyPolicy;
  TextEditingController get username => _username;
  TextEditingController get mobileNumber => _mobileNumber;
  TextEditingController get email => _email;
  TextEditingController get password => _password;
  TextEditingController get loginUsername => _loginUsername;
  TextEditingController get loginPassword => _loginPassword;
  GlobalKey<FormState> get formKey => _formKey;
  GlobalKey<FormState> get loginFormKey => _loginFormKey;

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
