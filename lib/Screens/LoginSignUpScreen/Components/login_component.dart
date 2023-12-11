import 'package:barber_klipz_ui/Utils/text_util.dart';
import 'package:flutter/material.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/button_util.dart';
import '../Backend/Provider/login_signup_base_model.dart';

Form loginComponent(LoginSignUpBaseModel baseModel) {
  return Form(
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: baseModel.screenUtil.setHeight(22),
        horizontal: baseModel.screenUtil.setWidth(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            cursorColor: kWhite,
            decoration: const InputDecoration(
              hintText: "Username or Email",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(20),
          ),
          TextFormField(
            cursorColor: kWhite,
            decoration: const InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(Icons.lock),
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
            height: baseModel.screenUtil.setHeight(190),
          ),
          ButtonUtil.primaryButton(
            text: "Log In",
            onPressed: () {},
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
                  color: kBlack,
                  fontSize: baseModel.screenUtil.setSp(15),
                ),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: TextStyle(
                      color: kWhite,
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
