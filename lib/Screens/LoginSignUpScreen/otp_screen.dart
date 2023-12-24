import 'dart:async';

import 'package:barber_klipz_ui/Screens/BottomNavigationBarScreen/bottom_navigation_bar_screen.dart';
import 'package:barber_klipz_ui/Screens/LoginSignUpScreen/Backend/Provider/login_signup_base_model.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../Resources/color_const.dart';
import '../../Utils/button_util.dart';
import '../../Utils/text_util.dart';
import '../../Utils/validator_util.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);
  final String phoneNumber;

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  Timer? _timer;
  int _start = 30;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }

    super.dispose();
  }

  @override
  void initState() {
    final baseModel = ref.read(loginSignUpBaseModel);
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(loginSignUpBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: "OTP Verification",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        leading: const BackButton(
          color: kWhite,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenUtil.setHeight(70),
              horizontal: screenUtil.setWidth(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  Icons.mobile_friendly_outlined,
                  size: 100,
                  color: kYellow,
                ),
              ),
              SizedBox(
                height: screenUtil.setHeight(15),
              ),
              TextUtil.secondaryText(
                text: "OTP Verification",
                color: kBlack,
                size: 18,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(
                height: screenUtil.setHeight(7),
              ),
              TextUtil.secondaryText(
                text:
                    "We will send you a One Time Password\n on your registered E-mail address",
                color: kBlack,
                size: 14,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: screenUtil.setHeight(17),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenUtil.setWidth(20)),
                child: PinCodeTextField(
                  onChanged: (value) {
                    // baseModel.setOtp(value);
                  },
                  appContext: context,
                  validator: ValidatorUtil.validateOtp,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  enableActiveFill: false,
                  autoFocus: false,
                  textStyle: TextStyle(
                    fontFamily: 'Poppins',
                    color: kGold,
                    fontSize: screenUtil.setHeight(18),
                    fontWeight: FontWeight.w500,
                  ),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(13),
                    borderWidth: 1,
                    activeColor: kYellow,
                    fieldHeight: screenUtil.setWidth(42),
                    fieldWidth: screenUtil.setWidth(42),
                    selectedColor: kYellow,
                    inactiveColor: kYellow,
                    fieldOuterPadding: EdgeInsets.symmetric(
                      horizontal: screenUtil.setWidth(1),
                    ),
                    activeFillColor: kYellow,
                  ),
                  cursorColor: kYellow,
                  animationDuration: const Duration(milliseconds: 300),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: screenUtil.setHeight(10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtil.secondaryText(
                    text: _start.toString().length > 1
                        ? '00:$_start'
                        : '00:0$_start',
                    color: kLicorice,
                    size: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    width: screenUtil.setWidth(30),
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (_start == 0) {
                        // await baseModel.sendOtp(
                        //   widget.phoneNumber,
                        //   context,
                        // );
                        _start = 30;
                        startTimer();
                      }
                    },
                    child: TextUtil.secondaryText(
                      text: 'Resend OTP',
                      color: _start == 0 ? kLicorice : kGrey,
                      size: 13,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenUtil.setHeight(21),
              ),
              ButtonUtil.primaryButton(
                text: 'Verify & Proceed',
                onPressed: () {
                  NavigatorUtil.push(context,
                      screen: BottomNavigationBarScreen());
                },
                screenUtil: screenUtil,
              ),
              SizedBox(
                height: screenUtil.setHeight(23),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By clicking “Sign Up”, you agree to our ',
                  style: TextStyle(
                    color: kTextBody,
                    fontSize: screenUtil.setSp(10),
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: 'Terms & Condition \n',
                      style: TextStyle(
                          color: kGold,
                          fontSize: screenUtil.setSp(10),
                          decoration: TextDecoration.underline),
                    ),
                    TextSpan(
                      text: 'and ',
                      style: TextStyle(
                        color: kTextBody,
                        fontSize: screenUtil.setSp(10),
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy',
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      style: TextStyle(
                        color: kGold,
                        decoration: TextDecoration.underline,
                        fontSize: screenUtil.setSp(10),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
