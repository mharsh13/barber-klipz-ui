import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:barber_klipz_ui/Screens/AccountSettingsScreen/account_settings_screen.dart';
import 'package:barber_klipz_ui/Screens/ProfileScreen/Backend/Provider/profile_base_model.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Provider/splash_base_model.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:barber_klipz_ui/Utils/net_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/text_util.dart';
import 'Components/post_component.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    final baseModel = ref.read(profileBaseModel);
    final splashBaseModel = ref.read(splashScreenBaseModel);
    splashBaseModel.getMe(context);
    getPosts(baseModel);
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  void getPosts(ProfileBaseModel baseModel) {
    baseModel.getAllUserPosts(context);
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(profileBaseModel);
    final splashBaseModel = ref.watch(splashScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenUtil.setHeight(150),
              child: Stack(
                children: [
                  SizedBox(
                      width: screenUtil.screenWidth,
                      height: screenUtil.setHeight(120),
                      child: const NetImage(
                        uri:
                            "https://media.istockphoto.com/id/603164912/photo/suburb-asphalt-road-and-sun-flowers.jpg?s=612x612&w=0&k=20&c=qLoQ5QONJduHrQ0kJF3fvoofmGAFcrq6cL84HbzdLQM=",
                        fit: BoxFit.cover,
                      )),
                  Positioned(
                    bottom: 0.5,
                    left: 145,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      width: screenUtil.setHeight(80),
                      height: screenUtil.setHeight(80),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: const NetImage(
                            fit: BoxFit.cover,
                            uri:
                                "https://images.unsplash.com/photo-1618641986557-1ecd230959aa?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: screenUtil.setWidth(12)),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                    icon: const Icon(Icons.more_horiz),
                    onPressed: () {
                      showAdaptiveActionSheet(
                        context: context,
                        isDismissible: true,
                        title: Container(
                          height: 6,
                          width: 40,
                          decoration: BoxDecoration(
                            color: kTextSubTitle,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        androidBorderRadius: 30,
                        actions: <BottomSheetAction>[
                          BottomSheetAction(
                              title: Row(
                                children: [
                                  const Icon(
                                    Icons.facebook,
                                    size: 28,
                                  ),
                                  SizedBox(
                                    width: screenUtil.setWidth(7),
                                  ),
                                  TextUtil.secondaryText(
                                    text: "Invite to Barber Klipz",
                                    color: kBlack,
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                              onPressed: (context) {}),
                          BottomSheetAction(
                              title: Row(
                                children: [
                                  const Icon(
                                    Icons.share,
                                    size: 28,
                                  ),
                                  SizedBox(
                                    width: screenUtil.setWidth(7),
                                  ),
                                  TextUtil.secondaryText(
                                    text: "Share Profile",
                                    color: kBlack,
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                              onPressed: (context) {}),
                          BottomSheetAction(
                              title: Row(
                                children: [
                                  const Icon(
                                    Icons.list,
                                    size: 28,
                                  ),
                                  SizedBox(
                                    width: screenUtil.setWidth(7),
                                  ),
                                  TextUtil.secondaryText(
                                    text: "Add to my Linktree",
                                    color: kBlack,
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                              onPressed: (context) {}),
                          BottomSheetAction(
                              title: Row(
                                children: [
                                  const Icon(
                                    Icons.block,
                                    size: 28,
                                  ),
                                  SizedBox(
                                    width: screenUtil.setWidth(7),
                                  ),
                                  TextUtil.secondaryText(
                                    text: "Blocked Users",
                                    color: kBlack,
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                              onPressed: (context) {}),
                        ],
                      );
                    },
                  )),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenUtil.setWidth(35)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      TextUtil.secondaryText(
                        text: "0",
                        color: kBlack,
                        size: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      TextUtil.secondaryText(
                        text: "Posts",
                        color: kTextSubTitle,
                        size: 12,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      TextUtil.secondaryText(
                        text: "0",
                        color: kBlack,
                        size: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      TextUtil.secondaryText(
                        text: "Followers",
                        color: kTextSubTitle,
                        size: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextUtil.secondaryText(
                        text: "0",
                        color: kBlack,
                        size: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      TextUtil.secondaryText(
                        text: "Following",
                        color: kTextSubTitle,
                        size: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextUtil.secondaryText(
                        text: "0",
                        color: kBlack,
                        size: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      TextUtil.secondaryText(
                        text: "Level",
                        color: kTextSubTitle,
                        size: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(25),
            ),
            TabBar(
              onTap: (int value) {
                baseModel.setValue(value);
              },
              dividerColor: kGrey,
              padding: EdgeInsets.only(bottom: screenUtil.setHeight(1)),
              indicatorColor: kGold,
              controller: _tabController,
              tabs: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: screenUtil.setHeight(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.grid_on,
                        color: kLicorice,
                      ),
                      SizedBox(
                        width: screenUtil.setWidth(5),
                      ),
                      TextUtil.secondaryText(
                        text: 'Post',
                        color: kLicorice,
                        size: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: screenUtil.setHeight(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.movie_creation_outlined,
                        color: kLicorice,
                      ),
                      SizedBox(
                        width: screenUtil.setWidth(5),
                      ),
                      TextUtil.secondaryText(
                        text: 'Flickz',
                        color: kLicorice,
                        size: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            baseModel.currentValue == 0
                ? postsComponent(screenUtil, baseModel)
                : Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenUtil.setHeight(20)),
                    child: Column(children: [
                      Icon(
                        Icons.video_collection_outlined,
                        color: kHintText,
                        size: screenUtil.setSp(80),
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(10),
                      ),
                      TextUtil.secondaryText(
                        text: "Your content has values!",
                        color: kBlack,
                        size: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(10),
                      ),
                      TextUtil.secondaryText(
                        text:
                            "Create your first piece of content\nand start making money.",
                        color: kBlack,
                        size: 14,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                      )
                    ]),
                  )
          ],
        ),
      ),
    );
  }
}
