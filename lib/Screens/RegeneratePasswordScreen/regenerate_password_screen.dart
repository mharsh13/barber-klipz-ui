import 'package:barber_klipz_ui/Screens/LoginSignUpScreen/login_signup_screen.dart';
import 'package:barber_klipz_ui/Screens/RegeneratePasswordScreen/Backend/Provider/regenerate_password_base_model.dart';
import 'package:barber_klipz_ui/Utils/gradient_background.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:barber_klipz_ui/Utils/toast_util.dart';
import 'package:barber_klipz_ui/Utils/validator_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/button_util.dart';
import '../../Utils/text_util.dart';

class RegeneratePasswordScreen extends ConsumerWidget {
  const RegeneratePasswordScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseModel = ref.watch(regeneratePasswordBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: "Regenerate Password",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        leading: const BackButton(
          color: kWhite,
        ),
      ),
      body: gradientBackground(
        screenUtil: baseModel.screenUtil,
        child: SingleChildScrollView(
          child: Form(
            key: baseModel.formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenUtil.setHeight(35),
                horizontal: screenUtil.setWidth(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextUtil.campaignTextFormField(
                    screenUtil: screenUtil,
                    inputType: TextInputType.text,
                    hintText: "New Password",
                    textEditingController: baseModel.newPassword,
                    validator: ValidatorUtil.validateText,
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(28),
                  ),
                  TextUtil.campaignTextFormField(
                    screenUtil: screenUtil,
                    inputType: TextInputType.text,
                    hintText: "Confirm Password",
                    textEditingController: baseModel.confirmPassword,
                    validator: ValidatorUtil.validateText,
                  ),
                  SizedBox(
                    height: baseModel.screenUtil.setHeight(400),
                  ),
                  ButtonUtil.primaryButton(
                    text: "Regenerate",
                    onPressed: () {
                      if (baseModel.formKey.currentState!.validate()) {
                        if (baseModel.newPassword.text ==
                            baseModel.confirmPassword.text) {
                          baseModel.changePassword(context);
                        } else {
                          ToastUtil(context).showErrorToastNotification(
                              "New password and confirm password should be same.");
                        }
                      }
                    },
                    screenUtil: baseModel.screenUtil,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
