import 'package:barber_klipz_ui/Utils/text_util.dart';
import 'package:barber_klipz_ui/Utils/validator_util.dart';
import 'package:flutter/material.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/button_util.dart';
import '../../../Utils/navigator_util.dart';
import '../../OnboardingScreen/onboarding_screen.dart';
import '../Backend/Provider/login_signup_base_model.dart';

Form loginComponent(BuildContext context, LoginSignUpBaseModel baseModel) {
  return Form(
    key: baseModel.loginFormKey,
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: baseModel.screenUtil.setHeight(22),
        horizontal: baseModel.screenUtil.setWidth(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: baseModel.loginUsername,
            validator: ValidatorUtil.validateText,
            cursorColor: kWhite,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundCard),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundCard),
              ),
              hintText: "Username or Email",
              hintStyle: TextStyle(color: kBackgroundCard),
              prefixIcon: Icon(
                Icons.person,
                color: kBackgroundCard,
              ),
            ),
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(20),
          ),
          TextFormField(
            validator: ValidatorUtil.validateText,
            cursorColor: kBackgroundCard,
            controller: baseModel.loginPassword,
            obscureText: true,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundCard),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundCard),
              ),
              hintText: "Password",
              hintStyle: TextStyle(color: kBackgroundCard),
              prefixIcon: Icon(
                Icons.lock,
                color: kBackgroundCard,
              ),
            ),
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(5),
          ),
          TextUtil.primaryText(
            text: "Forgot password?",
            color: kBackgroundCard,
            size: 12,
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(200),
          ),
          ButtonUtil.primaryButton(
            text: "Log In",
            onPressed: () {
              if (baseModel.loginFormKey.currentState!.validate()) {
                NavigatorUtil.push(context, screen: const OnboardingScreen());
              }
            },
            screenUtil: baseModel.screenUtil,
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(15),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Not a member yet? ',
                style: TextStyle(
                  color: kWhite,
                  fontSize: baseModel.screenUtil.setSp(15),
                ),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      color: kSecondaryInactive,
                      fontSize: baseModel.screenUtil.setSp(15),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
