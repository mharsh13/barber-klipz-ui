import 'package:flutter/material.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/navigator_util.dart';
import '../../../Utils/text_util.dart';
import '../../../Utils/validator_util.dart';
import '../Backend/Provider/login_signup_base_model.dart';
import '../otp_screen.dart';

Form forgotPasswordDialogBox(
    LoginSignUpBaseModel baseModel, BuildContext context) {
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
                          if (baseModel.forgotPasswordFormKey.currentState!
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
}
