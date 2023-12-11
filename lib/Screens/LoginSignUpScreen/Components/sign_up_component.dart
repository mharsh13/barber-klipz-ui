import 'package:flutter/material.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/button_util.dart';
import '../Backend/Provider/login_signup_base_model.dart';

Form signUpComponent(LoginSignUpBaseModel baseModel) {
  return Form(
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: baseModel.screenUtil.setHeight(22),
        horizontal: baseModel.screenUtil.setWidth(15),
      ),
      child: Column(
        children: [
          TextFormField(
            cursorColor: kWhite,
            decoration: const InputDecoration(
              hintText: "Username",
              prefixIcon: Icon(Icons.person),
            ),
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(20),
          ),
          TextFormField(
            cursorColor: kWhite,
            decoration: const InputDecoration(
              hintText: "Mobile Number",
              prefixIcon: Icon(Icons.call),
            ),
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(20),
          ),
          TextFormField(
            cursorColor: kWhite,
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Icon(Icons.email),
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
            height: baseModel.screenUtil.setHeight(25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: baseModel.screenUtil.setHeight(30),
                width: baseModel.screenUtil.setWidth(22),
                child: Checkbox(
                  value: baseModel.privacyPolicy,
                  onChanged: (value) {
                    baseModel.setPrivacyPolicy();
                  },
                ),
              ),
              SizedBox(
                width: baseModel.screenUtil.setWidth(8),
              ),
              RichText(
                text: TextSpan(
                  text:
                      'By clicking on the box, I indicate I have read\nBarber Klipz End User ',
                  style: TextStyle(
                    color: kBlack,
                    fontSize: baseModel.screenUtil.setSp(12),
                  ),
                  children: [
                    TextSpan(
                      text:
                          'License and Term of Use\nAgreement and Privacy Policy',
                      style: TextStyle(
                        color: kWhite,
                        fontSize: baseModel.screenUtil.setSp(12),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(23),
          ),
          ButtonUtil.primaryButton(
            text: "Sign Up",
            onPressed: () {},
            screenUtil: baseModel.screenUtil,
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(15),
          ),
          RichText(
            text: TextSpan(
              text: 'Already have an accoun? ',
              style: TextStyle(
                color: kBlack,
                fontSize: baseModel.screenUtil.setSp(15),
              ),
              children: [
                TextSpan(
                  text: 'Log In',
                  style: TextStyle(
                    color: kWhite,
                    fontSize: baseModel.screenUtil.setSp(15),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
