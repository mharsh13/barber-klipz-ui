// ignore_for_file: use_build_context_synchronously

import 'package:barber_klipz_ui/Screens/BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Resources/color_const.dart';
import '../../../../Utils/navigator_util.dart';
import '../../../../Utils/shared_preference_util.dart';
import '../../../../Utils/toast_util.dart';

final regeneratePasswordBaseModel =
    ChangeNotifierProvider((ref) => RegeneratePasswordBaseModel(ref));

class RegeneratePasswordBaseModel extends ChangeNotifier {
  final Ref ref;
  RegeneratePasswordBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final ApiHelper _apiHelper = ApiHelper();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get newPassword => _newPassword;
  TextEditingController get confirmPassword => _confirmPassword;
  ApiHelper get apiHelper => _apiHelper;

  //API functions

  Future<void> changePassword(BuildContext context) async {
    try {
      Loader.show(
        context,
        progressIndicator: const CircularProgressIndicator(
          color: kYellow,
        ),
      );
      notifyListeners();
      Map<String, dynamic> formData = {
        "password": _newPassword.text,
      };

      await _apiHelper
          .patchData(
              context: context, data: formData, url: "auth/change-password")
          .then((value) {
        Loader.hide();
        if (value != null) {
          if (value["message"] != null) {
            SharedPreferenceUtil.setJwt(value["token"]);
            ToastUtil(context).showSuccessToastNotification(value["message"]);
            NavigatorUtil.push(
              context,
              screen: const BottomNavigationBarScreen(),
            );
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
