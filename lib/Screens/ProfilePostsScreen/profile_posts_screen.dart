import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Screens/HomeScreen/Components/post_component.dart';
import 'package:barber_klipz_ui/Screens/ProfilePostsScreen/Backend/Provider/profile_posts_base_model.dart';
import 'package:barber_klipz_ui/Utils/net_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../Utils/navigator_util.dart';
import '../../Utils/text_util.dart';
import '../AccountSettingsScreen/account_settings_screen.dart';
import '../SplashScreen/Backend/Provider/splash_base_model.dart';

class ProfilePostScreen extends ConsumerStatefulWidget {
  const ProfilePostScreen({super.key});

  @override
  ConsumerState<ProfilePostScreen> createState() => _ProfilePostScreenState();
}

class _ProfilePostScreenState extends ConsumerState<ProfilePostScreen> {
  @override
  void initState() {
    final baseModel = ref.read(profilePostBaseModel);
    // final splashModel = ref.read(splashScreenBaseModel);
    // if (splashModel.user == null) {
    //   splashModel.getMe(context);
    // }
    getPosts(baseModel);
    super.initState();
  }

  void getPosts(
    ProfilePostBaseModel baseModel,
  ) async {
    await baseModel.getAllUserPosts(context);
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(profilePostBaseModel);
    final splashBaseModel = ref.watch(splashScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlack2,
          title: TextUtil.secondaryText(
            text: splashBaseModel.user == null
                ? ""
                : splashBaseModel.user!.user_name,
            color: kGold,
            size: 18,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
          leading: Row(
            children: [
              SizedBox(
                width: screenUtil.setWidth(5),
              ),
              Flexible(
                child: IconButton(
                  icon: const Icon(
                    Icons.cut_outlined,
                    color: kWhite,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: screenUtil.setWidth(30),
              ),
              Flexible(
                child: IconButton(
                  icon: const Icon(
                    Icons.star_border_outlined,
                    color: kWhite,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          actions: [
            Flexible(
              child: IconButton(
                icon: const Icon(
                  Icons.attach_money,
                  color: kWhite,
                ),
                onPressed: () {},
              ),
            ),
            Flexible(
              child: IconButton(
                icon: const Icon(Icons.settings),
                color: kWhite,
                onPressed: () {
                  NavigatorUtil.push(
                    context,
                    screen: const AccountSettingsScreen(),
                  );
                },
              ),
            ),
          ],
        ),
        body: baseModel.loader
            ? const Center(
                child: CircularProgressIndicator(
                  color: kYellow,
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: screenUtil.setHeight(8),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: baseModel.allPosts.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return PostComponent(post: baseModel.allPosts[index]);
                      },
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
