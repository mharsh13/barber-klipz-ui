import 'package:barber_klipz_ui/Providers/user_base_model.dart';
import 'package:barber_klipz_ui/Screens/AccountSettingsScreen/Backend/Provider/account_settings_base_model.dart';
import 'package:barber_klipz_ui/Screens/OnboardingScreen/onboarding_screen.dart';
import 'package:barber_klipz_ui/Utils/button_util.dart';
import 'package:barber_klipz_ui/Utils/shared_preference_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/navigator_util.dart';
import '../../Utils/text_util.dart';
import 'Components/account_section.dart';
import 'Components/category_section.dart';
import 'Components/edit_profile_section.dart';
import 'Components/help_section.dart';
import 'Components/month_statistics.dart';
import 'Components/payment_profile.dart';

class AccountSettingsScreen extends ConsumerStatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  ConsumerState<AccountSettingsScreen> createState() =>
      _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends ConsumerState<AccountSettingsScreen> {
  @override
  void initState() {
    final baseModel = ref.read(accountSettingsBaseModel);
    final userBase = ref.read(userBaseModel);
    getDetails(baseModel, userBase);
    super.initState();
  }

  void getDetails(
      AccountSettingsBaseModel baseModel, UserBaseModel userBaseModel) {
    if (userBaseModel.user != null) {
      baseModel.initialize(userBaseModel);
    }
    _loader = false;
  }

  bool _loader = true;

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(accountSettingsBaseModel);
    final userBase = ref.watch(userBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: "Account Settings",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        leading: const BackButton(
          color: kWhite,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenUtil.setWidth(8)),
            child: GestureDetector(
              onTap: () {
                baseModel.updateProfile(
                  context,
                  userBase,
                );
              },
              child: TextUtil.secondaryText(
                text: "Save",
                color: kWhite,
                size: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
      body: _loader
          ? const Center(
              child: CircularProgressIndicator(
                color: kYellow,
              ),
            )
          : GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    editProfile(
                      screenUtil,
                      baseModel,
                      context,
                    ),
                    category(screenUtil),
                    paymentProfile(screenUtil),
                    monthStatistics(screenUtil),
                    accountSection(context, screenUtil),
                    helpSection(screenUtil),
                    SizedBox(
                      height: screenUtil.setHeight(20),
                    ),
                    Center(
                      child: ButtonUtil.primaryButton(
                          text: "Logout",
                          onPressed: () {
                            SharedPreferenceUtil.setJwt('');
                            NavigatorUtil.pushAndRemoveUntil(context,
                                screen: const OnboardingScreen());
                          },
                          screenUtil: screenUtil),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(15),
                    ),
                    Center(
                      child: TextUtil.secondaryText(
                        text: "Delete Account",
                        color: kYellow,
                        size: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(25),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
