import 'package:barber_klipz_ui/Screens/OnboardingScreen/onboarding_screen.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/button_util.dart';
import '../../../Utils/validator_util.dart';
import '../Backend/Provider/login_signup_base_model.dart';

Form signUpComponent(BuildContext context, LoginSignUpBaseModel baseModel) {
  return Form(
    key: baseModel.formKey,
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: baseModel.screenUtil.setHeight(22),
        horizontal: baseModel.screenUtil.setWidth(15),
      ),
      child: Column(
        children: [
          TextFormField(
            cursorColor: kBackgroundCard,
            controller: baseModel.username,
            keyboardType: TextInputType.text,
            validator: ValidatorUtil.validateText,
            decoration: const InputDecoration(
              hintText: "Username",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundCard),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundCard),
              ),
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
            controller: baseModel.mobileNumber,
            validator: ValidatorUtil.validatePhone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            keyboardType: TextInputType.phone,
            cursorColor: kBackgroundCard,
            decoration: InputDecoration(
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundCard),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundCard),
              ),
              hintStyle: const TextStyle(color: kBackgroundCard),
              hintText: "Mobile Number",
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.call,
                    color: kBackgroundCard,
                  ),
                  CountryCodePicker(
                    onChanged: (CountryCode code) {},
                    initialSelection: 'IN',
                    favorite: const ['+91'],
                    showFlag: true,
                    showCountryOnly: false,
                    alignLeft: false,
                    textStyle:
                        const TextStyle(fontSize: 16.0, color: kBackgroundCard),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(20),
          ),
          TextFormField(
            validator: ValidatorUtil.validateText,
            controller: baseModel.email,
            cursorColor: kBackgroundCard,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundCard),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundCard),
              ),
              hintStyle: TextStyle(color: kBackgroundCard),
              hintText: "Email",
              prefixIcon: Icon(
                Icons.email,
                color: kBackgroundCard,
              ),
            ),
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(20),
          ),
          TextFormField(
            validator: ValidatorUtil.validateText,
            keyboardType: TextInputType.text,
            obscureText: true,
            controller: baseModel.password,
            cursorColor: kBackgroundCard,
            decoration: const InputDecoration(
              hintText: "Password",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundCard),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kBackgroundCard),
              ),
              hintStyle: TextStyle(color: kBackgroundCard),
              prefixIcon: Icon(
                Icons.lock,
                color: kBackgroundCard,
              ),
            ),
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(45),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: baseModel.screenUtil.setHeight(20),
                width: baseModel.screenUtil.setWidth(20),
                child: Checkbox(
                  activeColor: kSecondaryInactive,
                  side: const BorderSide(
                    color: kWhite,
                    width: 2,
                  ),
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
                    color: kGrey,
                    fontSize: baseModel.screenUtil.setSp(12),
                  ),
                  children: [
                    TextSpan(
                      text:
                          'License and Term of Use\nAgreement and Privacy Policy',
                      style: TextStyle(
                        color: kSecondaryInactive,
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
            onPressed: () {
              if (baseModel.formKey.currentState!.validate()) {
                NavigatorUtil.push(context, screen: const OnboardingScreen());
              }
            },
            screenUtil: baseModel.screenUtil,
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(15),
          ),
          RichText(
            text: TextSpan(
              text: 'Already have an account? ',
              style: TextStyle(
                color: kGrey,
                fontSize: baseModel.screenUtil.setSp(15),
              ),
              children: [
                TextSpan(
                  text: 'Log In',
                  style: TextStyle(
                    color: kSecondaryInactive,
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
