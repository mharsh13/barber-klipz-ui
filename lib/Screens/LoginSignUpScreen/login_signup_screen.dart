import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Resources/image_const.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Utils/text_util.dart';
import 'Backend/Provider/login_signup_base_model.dart';
import 'Components/login_component.dart';
import 'Components/sign_up_component.dart';

class LoginSignupScreen extends ConsumerStatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  ConsumerState<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends ConsumerState<LoginSignupScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(loginSignUpBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      backgroundColor: kSecondaryInactive,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenUtil.setHeight(45),
            horizontal: screenUtil.setWidth(20),
          ),
          child: Column(children: [
            Center(
              child: Container(
                height: screenUtil.setHeight(100),
                width: screenUtil.setHeight(100),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(55),
                  child: Image.asset(ImageConst.appLogo),
                ),
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(30),
            ),
            TabBar(
              onTap: (int value) {
                baseModel.setValue(value);
              },
              padding: EdgeInsets.only(bottom: screenUtil.setHeight(1)),
              indicatorColor: kSecondary,
              controller: _tabController,
              tabs: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: screenUtil.setHeight(10),
                  ),
                  child: TextUtil.secondaryText(
                    text: 'Sign up',
                    color: kWhite,
                    size: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: screenUtil.setHeight(10),
                  ),
                  child: TextUtil.secondaryText(
                    text: 'Log in',
                    color: kWhite,
                    size: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            baseModel.currentValue == 0
                ? signUpComponent(baseModel)
                : loginComponent(baseModel)
          ]),
        ),
      ),
    );
  }
}
