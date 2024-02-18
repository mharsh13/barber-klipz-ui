import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:barber_klipz_ui/Screens/AccountSettingsScreen/account_settings_screen.dart';
import 'package:barber_klipz_ui/Screens/BarberProfileScreen/Backend/Provider/barber_profile_base_model.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Models/user_model.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Provider/splash_base_model.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:barber_klipz_ui/Utils/net_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/text_util.dart';
import 'Backend/Components/post_component.dart';

class BarberProfileScreen extends ConsumerStatefulWidget {
  final UserModel user;
  const BarberProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  ConsumerState<BarberProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<BarberProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    final baseModel = ref.read(barberProfileBaseModel);
    final splashBaseModel = ref.read(splashScreenBaseModel);
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(barberProfileBaseModel);
    final splashBaseModel = ref.watch(splashScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: widget.user.user_name,
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        leading: const BackButton(
          color: kWhite,
        ),
        actions: [
          Flexible(
            child: IconButton(
              icon: const Icon(
                Icons.favorite_border,
                color: kWhite,
              ),
              onPressed: () {},
            ),
          ),
          Flexible(
            child: IconButton(
              icon: const Icon(Icons.star_border_outlined),
              color: kWhite,
              onPressed: () {},
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
                    height: screenUtil.setHeight(150),
                    child: Stack(
                      children: [
                        SizedBox(
                            width: screenUtil.screenWidth,
                            height: screenUtil.setHeight(120),
                            child: NetImage(
                              uri: widget.user.cover_image ?? "",
                              fit: BoxFit.cover,
                            )),
                        Positioned(
                          bottom: 0.5,
                          left: 145,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            width: screenUtil.setHeight(80),
                            height: screenUtil.setHeight(80),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: NetImage(
                                  fit: BoxFit.cover,
                                  uri: widget.user.profile_image ?? "",
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextUtil.secondaryText(
                              text: widget.user.first_name == null ||
                                      widget.user.last_name == null
                                  ? ""
                                  : "${widget.user.first_name} ${widget.user.last_name}",
                              color: kBlack,
                              size: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            const Spacer(),
                            const Icon(Icons.email_outlined),
                            SizedBox(
                              width: screenUtil.setWidth(12),
                            ),
                            GestureDetector(
                              onTap: () {
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
                              child: const Icon(Icons.more_horiz),
                            ),
                          ],
                        ),
                        TextUtil.secondaryText(
                          text: "Dancer, Artist, Entrepreneur",
                          color: kTextSubTitle.withOpacity(0.8),
                          size: 11,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(2),
                        ),
                        Container(
                          constraints: BoxConstraints(
                            maxWidth: screenUtil.setWidth(290),
                          ),
                          child: TextUtil.secondaryText(
                            text: widget.user.bio ?? "",
                            color: kBlack,
                            size: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenUtil.setWidth(35)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            TextUtil.secondaryText(
                              text: "1",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: screenUtil.setWidth(85),
                          height: screenUtil.setHeight(28),
                          decoration: BoxDecoration(
                            border: Border.all(color: kYellow),
                            borderRadius: BorderRadius.circular(
                              screenUtil.setSp(100),
                            ),
                          ),
                          child: Center(
                            child: TextUtil.secondaryText(
                              text: "Follow",
                              color: kBlack,
                              size: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenUtil.setWidth(10),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: screenUtil.setWidth(85),
                          height: screenUtil.setHeight(28),
                          decoration: BoxDecoration(
                            border: Border.all(color: kYellow),
                            borderRadius: BorderRadius.circular(
                              screenUtil.setSp(100),
                            ),
                          ),
                          child: Center(
                            child: TextUtil.secondaryText(
                              text: "Subscribe",
                              color: kBlack,
                              size: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
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
