import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Provider/splash_base_model.dart';
import 'package:barber_klipz_ui/Utils/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Utils/text_util.dart';
import 'Backend/Provider/login_signup_base_model.dart';
import 'Components/login_component.dart';
import 'Components/sign_up_component.dart';

// ignore: must_be_immutable
class LoginSignupScreen extends ConsumerStatefulWidget {
  LoginSignupScreen({super.key, required this.selectedPage});
  int selectedPage;
  @override
  ConsumerState<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends ConsumerState<LoginSignupScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.selectedPage,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(loginSignUpBaseModel);
    final splashModel = ref.watch(splashScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      backgroundColor: kSecondaryInactive,
      body: gradientBackground(
        screenUtil: screenUtil,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: screenUtil.setHeight(65),
            horizontal: screenUtil.setWidth(20),
          ),
          child: SingleChildScrollView(
            child: Column(children: [
              Center(
                child: TextUtil.secondaryText(
                    text: "Barber Klipz",
                    color: kGold,
                    size: 25,
                    fontWeight: FontWeight.bold),
                // child: Container(
                //   height: screenUtil.setHeight(100),
                //   width: screenUtil.setHeight(100),
                //   decoration: const BoxDecoration(shape: BoxShape.circle),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(55),
                //     child: Image.asset(ImageConst.appLogo),
                //   ),
                // ),
              ),
              SizedBox(
                height: screenUtil.setHeight(30),
              ),
              TabBar(
                onTap: (int value) {
                  baseModel.setValue(value);
                },
                padding: EdgeInsets.only(bottom: screenUtil.setHeight(1)),
                indicatorColor: kBackground,
                controller: _tabController,
                tabs: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: screenUtil.setHeight(10),
                    ),
                    child: TextUtil.secondaryText(
                      text: 'Sign up',
                      color: kGold,
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
                      color: kGold,
                      size: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              baseModel.currentValue == 0
                  ? signUpComponent(context, baseModel)
                  : loginComponent(context, baseModel, splashModel)
            ]),
          ),
        ),
      ),
    );
  }
}
