import 'package:barber_klipz_ui/Providers/chat_base_model.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Provider/splash_base_model.dart';
import 'package:barber_klipz_ui/Utils/text_util.dart';
import 'package:barber_klipz_ui/Utils/validator_util.dart';
import 'package:flutter/material.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/button_util.dart';
import '../Backend/Provider/login_signup_base_model.dart';
import 'forget_password_dialog_box.dart';

Form loginComponent(BuildContext context, LoginSignUpBaseModel baseModel,
    SplashScreenBaseModel splashScreenBaseModel, ChatBaseModel chatModel) {
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
            style: const TextStyle(color: kGold),
            controller: baseModel.loginUsername,
            validator: ValidatorUtil.validateText,
            cursorColor: kGold,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kGold),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kGold),
              ),
              hintText: "Username or Email",
              hintStyle: TextStyle(color: kGold),
              prefixIcon: Icon(
                Icons.person,
                color: kGold,
              ),
            ),
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(20),
          ),
          TextFormField(
            style: const TextStyle(color: kGold),
            validator: ValidatorUtil.validateText,
            cursorColor: kGold,
            controller: baseModel.loginPassword,
            obscureText: true,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kGold),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kGold),
              ),
              hintText: "Password",
              hintStyle: TextStyle(color: kGold),
              prefixIcon: Icon(
                Icons.lock,
                color: kGold,
              ),
            ),
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(5),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return forgotPasswordDialogBox(baseModel, context);
                },
              );
            },
            child: TextUtil.primaryText(
              text: "Forgot password?",
              color: kBackgroundCard,
              size: 12,
            ),
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(200),
          ),
          ButtonUtil.primaryButton(
            text: "Log In",
            onPressed: () {
              if (baseModel.loginFormKey.currentState!.validate()) {
                baseModel.login(context, splashScreenBaseModel, chatModel);
              }
            },
            screenUtil: baseModel.screenUtil,
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(15),
          ),
          GestureDetector(
            onTap: () {
              baseModel.setValue(0);
            },
            child: Center(
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
                        color: kGold,
                        fontSize: baseModel.screenUtil.setSp(15),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
