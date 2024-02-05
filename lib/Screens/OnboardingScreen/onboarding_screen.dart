import 'package:barber_klipz_ui/Screens/LoginSignUpScreen/login_signup_screen.dart';
import 'package:barber_klipz_ui/Screens/OnboardingScreen/Backend/Provider/onboarding_base_model.dart';
import 'package:barber_klipz_ui/Utils/button_util.dart';
import 'package:barber_klipz_ui/Utils/gradient_background.dart';
import 'package:barber_klipz_ui/Utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/navigator_util.dart';
import '../LoginSignUpScreen/Backend/Provider/login_signup_base_model.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseModel = ref.watch(onboardingBaseModel);
    final loginBaseModel = ref.watch(loginSignUpBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      body: gradientBackground(
        screenUtil: screenUtil,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenUtil.setHeight(30),
            horizontal: screenUtil.setWidth(30),
          ),
          child: Column(
            children: [
              SizedBox(
                height: screenUtil.setHeight(40),
              ),
              TextUtil.secondaryText(
                text: "Barber Klipz",
                color: kGold,
                size: 25,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: screenUtil.setHeight(140),
              ),
              Center(
                child: TextUtil.secondaryText(
                  text:
                      "Create content yourself,\ngain points, create challenges,\nbook appointments and\n make money",
                  color: kWhite,
                  size: 15,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: screenUtil.setHeight(190),
              ),
              ButtonUtil.primaryButton(
                text: "Sign Up",
                onPressed: () {
                  loginBaseModel.setValue(0);
                  NavigatorUtil.push(context,
                      screen: LoginSignupScreen(
                        selectedPage: 0,
                      ));
                },
                screenUtil: screenUtil,
              ),
              SizedBox(
                height: screenUtil.setHeight(15),
              ),
              ButtonUtil.primaryButton(
                text: "Log In",
                onPressed: () {
                  loginBaseModel.setValue(1);
                  NavigatorUtil.push(
                    context,
                    screen: LoginSignupScreen(
                      selectedPage: 1,
                    ),
                  );
                },
                screenUtil: screenUtil,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
