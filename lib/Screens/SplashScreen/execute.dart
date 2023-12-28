import 'package:barber_klipz_ui/Providers/user_base_model.dart';
import 'package:flutter/material.dart';

import '../../Utils/shared_preference_util.dart';
import '../BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';
import '../OnboardingScreen/onboarding_screen.dart';

execute(
  BuildContext context,
  UserBaseModel userBaseModel,
) async {
  Future.delayed(const Duration(seconds: 2)).then((value) async {
    await SharedPreferenceUtil.getJwt().then((value) async {
      if (value == "") {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const OnboardingScreen(),
          ),
        );
      } else {
        await userBaseModel.getUserDetails(context).then((value) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const BottomNavigationBarScreen(),
            ),
          );
        });
      }
    });
  });
}
