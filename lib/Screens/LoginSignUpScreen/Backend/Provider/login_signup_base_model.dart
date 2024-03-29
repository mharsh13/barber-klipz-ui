// ignore_for_file: use_build_context_synchronously

import 'package:barber_klipz_ui/Providers/chat_base_model.dart';
import 'package:barber_klipz_ui/Screens/BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';
import 'package:barber_klipz_ui/Screens/LoginSignUpScreen/otp_screen.dart';
import 'package:barber_klipz_ui/Screens/RegeneratePasswordScreen/regenerate_password_screen.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Provider/splash_base_model.dart';
import 'package:barber_klipz_ui/Utils/shared_preference_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Resources/color_const.dart';
import '../../../../Utils/navigator_util.dart';
import '../../../../Utils/toast_util.dart';

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
  final ApiHelper _apiHelper = ApiHelper();
  final TextEditingController _otp = TextEditingController();
  final TextEditingController _forgetOtp = TextEditingController();
  final TextEditingController _forgotEmail = TextEditingController();
  final GlobalKey<FormState> _forgotPasswordFormKey = GlobalKey<FormState>();

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
  ApiHelper get apiHelper => _apiHelper;
  TextEditingController get otp => _otp;
  TextEditingController get forgetOtp => _forgetOtp;
  TextEditingController get forgotEmail => _forgotEmail;
  GlobalKey<FormState> get forgotPasswordFormKey => _forgotPasswordFormKey;

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

  //api functions

  Future<void> registerUser(BuildContext context) async {
    try {
      Loader.show(
        context,
        progressIndicator: const CircularProgressIndicator(
          color: kYellow,
        ),
      );
      notifyListeners();
      Map<String, dynamic> formData = {
        "email": _email.text,
        "password": _password.text,
        "user_name": _username.text,
        "phone": _mobileNumber.text,
      };

      await _apiHelper
          .postData(context: context, data: formData, url: "auth/register")
          .then((value) {
        Loader.hide();
        if (value != null) {
          if (value["token"] != null) {
            // Global.jwt = value["token"];
            SharedPreferenceUtil.setJwt(value["token"]);
            NavigatorUtil.push(context,
                screen: OtpScreen(
                  forgotPassword: false,
                ));
          }
        }
      });
      notifyListeners();
    } catch (e) {
      Loader.hide();
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }

  Future<void> verifyEmail(
      BuildContext context,
      SplashScreenBaseModel splashScreenBaseModel,
      ChatBaseModel chatModel) async {
    try {
      Loader.show(
        context,
        progressIndicator: const CircularProgressIndicator(
          color: kYellow,
        ),
      );
      notifyListeners();
      Map<String, dynamic> formData = {
        "otp": _otp.text,
      };
      await _apiHelper
          .putData(context: context, data: formData, url: "auth/verifyEmail")
          .then((value) async {
        Loader.hide();
        if (value != null) {
          if (value["token"] != null) {
            SharedPreferenceUtil.setJwt(value["token"]);
            ToastUtil(context)
                .showSuccessToastNotification("Sign up successfull");
            chatModel.connectSocket(value["token"]);
            await splashScreenBaseModel.getMe(context).then((value) => {
                  NavigatorUtil.pushAndRemoveUntil(context,
                      screen: const BottomNavigationBarScreen())
                });
          }
        }
      });
      notifyListeners();
    } catch (e) {
      Loader.hide();
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }

  Future<void> login(
      BuildContext context,
      SplashScreenBaseModel splashScreenBaseModel,
      ChatBaseModel chatModel) async {
    try {
      Loader.show(
        context,
        progressIndicator: const CircularProgressIndicator(
          color: kYellow,
        ),
      );
      notifyListeners();
      Map<String, dynamic> formData = {
        "emailOrUsername": _loginUsername.text,
        "password": _loginPassword.text,
      };

      await _apiHelper
          .postData(context: context, data: formData, url: "auth/login")
          .then((value) async {
        Loader.hide();
        if (value != null) {
          if (value["token"] != null) {
            SharedPreferenceUtil.setJwt(value["token"]);
            ToastUtil(context)
                .showSuccessToastNotification("Logged In Successfully");
            chatModel.connectSocket(value["token"]);
            await splashScreenBaseModel.getMe(context).then((value) {
              NavigatorUtil.pushAndRemoveUntil(context,
                  screen: const BottomNavigationBarScreen());
            });
          }
        }
      });
      notifyListeners();
    } catch (e) {
      Loader.hide();
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }

  Future<void> updateOtp(BuildContext context) async {
    try {
      Loader.show(
        context,
        progressIndicator: const CircularProgressIndicator(
          color: kYellow,
        ),
      );
      notifyListeners();
      Map<String, dynamic> formData = {
        "email": _forgotEmail.text,
      };

      await _apiHelper
          .patchData(context: context, data: formData, url: "auth/update-otp")
          .then((value) {
        Loader.hide();
        if (value != null) {
          if (value["message"] != null) {
            SharedPreferenceUtil.setJwt(value["token"]);
            ToastUtil(context).showSuccessToastNotification(value["message"]);
            NavigatorUtil.push(context,
                screen: OtpScreen(
                  forgotPassword: true,
                ));
          }
        }
      });
      notifyListeners();
    } catch (e) {
      Loader.hide();
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }

  Future<void> verifyForgotPassword(BuildContext context) async {
    try {
      Loader.show(
        context,
        progressIndicator: const CircularProgressIndicator(
          color: kYellow,
        ),
      );
      notifyListeners();
      Map<String, dynamic> formData = {
        "otp": _forgetOtp.text,
      };

      await _apiHelper
          .postData(
              context: context, data: formData, url: "auth/verify-forget-pwd")
          .then((value) {
        Loader.hide();
        if (value != null) {
          if (value["token"] != null) {
            SharedPreferenceUtil.setJwt(value["token"]);
            ToastUtil(context)
                .showSuccessToastNotification("OTP verified Successfully");
            NavigatorUtil.push(context,
                screen: const RegeneratePasswordScreen());
          }
        }
      });
      notifyListeners();
    } catch (e) {
      Loader.hide();
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }
}
