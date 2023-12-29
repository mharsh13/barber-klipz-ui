import 'package:barber_klipz_ui/global.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/button_util.dart';
import '../../../Utils/validator_util.dart';
import '../Backend/Provider/login_signup_base_model.dart';

Form signUpComponent(
  BuildContext context,
  LoginSignUpBaseModel baseModel,
) {
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
            cursorColor: kGold,
            controller: baseModel.username,
            keyboardType: TextInputType.text,
            style: const TextStyle(color: kGold),
            validator: ValidatorUtil.validateText,
            decoration: const InputDecoration(
              hintText: "Username",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kGold),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kGold),
              ),
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
            controller: baseModel.mobileNumber,
            validator: ValidatorUtil.validatePhone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            style: const TextStyle(color: kGold),
            keyboardType: TextInputType.phone,
            cursorColor: kGold,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(top: 15),
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kGold),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kGold),
              ),
              hintStyle: const TextStyle(
                color: kGold,
              ),
              hintText: "Mobile No.",
              prefixIcon: Padding(
                padding:
                    EdgeInsets.only(left: baseModel.screenUtil.setWidth(10)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.call,
                      color: kGold,
                    ),
                    CountryCodePicker(
                      // showDropDownButton: true,
                      onChanged: (CountryCode code) {},
                      initialSelection: 'ZA',
                      favorite: const ['+27'],
                      showFlag: true,
                      showCountryOnly: false,
                      alignLeft: false,
                      textStyle: const TextStyle(fontSize: 16.0, color: kGold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(20),
          ),
          TextFormField(
            style: const TextStyle(color: kGold),
            validator: ValidatorUtil.validateText,
            controller: baseModel.email,
            cursorColor: kGold,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kGold),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kGold),
              ),
              hintStyle: TextStyle(color: kGold),
              hintText: "Email",
              prefixIcon: Icon(
                Icons.email,
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
            keyboardType: TextInputType.text,
            obscureText: true,
            controller: baseModel.password,
            cursorColor: kGold,
            decoration: const InputDecoration(
              hintText: "Password",
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kGold),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kGold),
              ),
              hintStyle: TextStyle(color: kGold),
              prefixIcon: Icon(
                Icons.lock,
                color: kGold,
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
                  activeColor: kGold,
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
                        color: kGold,
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
                baseModel.registerUser(context);
              }
            },
            screenUtil: baseModel.screenUtil,
          ),
          SizedBox(
            height: baseModel.screenUtil.setHeight(15),
          ),
          GestureDetector(
            onTap: () {
              baseModel.setValue(1);
            },
            child: RichText(
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
                      color: kGold,
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
