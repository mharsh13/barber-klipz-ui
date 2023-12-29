import 'package:barber_klipz_ui/Screens/LoginSignUpScreen/otp_screen.dart';
import 'package:barber_klipz_ui/Utils/text_util.dart';
import 'package:barber_klipz_ui/Utils/validator_util.dart';
import 'package:flutter/material.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/button_util.dart';
import '../../../Utils/navigator_util.dart';
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
                  return Form(
                    key: baseModel.forgotPasswordFormKey,
                    child: AlertDialog(
                      backgroundColor: kYellow,
                      surfaceTintColor: Colors.transparent,
                      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
                      contentPadding: const EdgeInsets.all(18),
                      content: SizedBox(
                          height: baseModel.screenUtil.setHeight(167),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextUtil.secondaryText(
                                  text: "Forgot your Password?",
                                  color: kBlack,
                                  size: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  height: baseModel.screenUtil.setHeight(8),
                                ),
                                TextUtil.secondaryText(
                                  text:
                                      "Please provide your email and we\nwill send you an OTP.",
                                  color: kBlack,
                                  size: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: baseModel.screenUtil.setHeight(8),
                                ),
                                TextUtil.editProfileTextFormField(
                                  screenUtil: baseModel.screenUtil,
                                  hintText: "Email",
                                  controller: baseModel.forgotEmail,
                                  validator: ValidatorUtil.validateText,
                                ),
                                SizedBox(
                                  height: baseModel.screenUtil.setHeight(18),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: TextUtil.secondaryText(
                                          text: "Cancel",
                                          color: kBlack,
                                          size: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          if (baseModel.forgotPasswordFormKey
                                              .currentState!
                                              .validate()) {
                                            NavigatorUtil.push(context,
                                                screen: OtpScreen(
                                                  forgotPassword: true,
                                                ));
                                          }
                                        },
                                        child: TextUtil.secondaryText(
                                          text: "Confirm",
                                          color: kBlack,
                                          size: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  );
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
                baseModel.login(context);
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
