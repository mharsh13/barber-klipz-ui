import 'package:barber_klipz_ui/Helpers/api_helpers.dart';
import 'package:barber_klipz_ui/Screens/OnboardingScreen/onboarding_screen.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:barber_klipz_ui/Utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Resources/color_const.dart';
import '../../../../Utils/shared_preference_util.dart';

final accountSettingsBaseModel =
    ChangeNotifierProvider((ref) => AccountSettingsBaseModel(ref));

class AccountSettingsBaseModel extends ChangeNotifier {
  final Ref ref;
  AccountSettingsBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  ApiHelper _apiHelper = ApiHelper();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  ApiHelper get apiHelper => _apiHelper;

  //API functions

  // Future<void> logout(BuildContext context) async {
  //   try {
  //     Loader.show(
  //       context,
  //       progressIndicator: const CircularProgressIndicator(
  //         color: kYellow,
  //       ),
  //     );
  //     notifyListeners();
  //     await _apiHelper
  //         .postData(context: context, data: "", url: "auth/logout")
  //         .then((value) {
  //       Loader.hide();
  //       if (value != null) {
  //         print(value);
  //         SharedPreferenceUtil.removeJwt();
  //         ToastUtil(context).showSuccessToastNotification(value["message"]);
  //         NavigatorUtil.pushAndRemoveUntil(context, screen: OnboardingScreen());
  //       }
  //     });
  //     notifyListeners();
  //   } catch (e) {
  //     print(e);
  //     Loader.hide();
  //     ToastUtil(context).showErrorToastNotification("Something went wrong");
  //   }
  // }
}
