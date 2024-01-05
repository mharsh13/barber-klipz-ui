import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Resources/image_const.dart';
import 'package:barber_klipz_ui/Screens/AudioVideoChatRoomScreen/audio_video_chat_room_screen.dart';
import 'package:barber_klipz_ui/Screens/FadedPointsScreen/faded_points_screen.dart';
import 'package:barber_klipz_ui/Screens/InboxScreen/inbox_screen.dart';
import 'package:barber_klipz_ui/Screens/HomeScreen/Backend/Provider/home_screen_base_model.dart';
import 'package:barber_klipz_ui/Screens/ViewFlickzScreen/view_flickz_screen.dart';
import 'package:barber_klipz_ui/Utils/net_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:badges/badges.dart' as badges;

import '../../Utils/navigator_util.dart';
import '../../Utils/text_util.dart';
import '../ViewAllCommentsScreen/view_all_comments_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseModel = ref.watch(homeScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBlack2,
          title: TextUtil.secondaryText(
            text: "Barber Klipz",
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
                    Icons.movie_creation_outlined,
                    color: kWhite,
                  ),
                  onPressed: () {
                    NavigatorUtil.push(
                      context,
                      screen: const ViewFlickzScreen(),
                    );
                  },
                ),
              ),
              SizedBox(
                width: screenUtil.setWidth(45),
              ),
              Flexible(
                child: IconButton(
                  icon: const Icon(
                    Icons.chat_outlined,
                    color: kWhite,
                  ),
                  onPressed: () {
                    NavigatorUtil.push(context,
                        screen: const AudioVideoChatRoomScreen());
                  },
                ),
              ),
            ],
          ),
          actions: [
            Flexible(
              child: IconButton(
                icon: const Icon(
                  Icons.cut_outlined,
                  color: kWhite,
                ),
                onPressed: () {
                  NavigatorUtil.push(context,
                      screen: const FadedPointsScreen());
                },
              ),
            ),
            Flexible(
              child: IconButton(
                icon: const Icon(Icons.email_outlined),
                color: kWhite,
                onPressed: () {
                  NavigatorUtil.push(context, screen: const InboxScreen());
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenUtil.setHeight(8),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: screenUtil.setHeight(50),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return index == 0
                        ? badges.Badge(
                            position: badges.BadgePosition.bottomEnd(
                                bottom: -1, end: 5),
                            showBadge: true,
                            badgeStyle: const badges.BadgeStyle(
                              badgeColor: kYellow,
                            ),
                            onTap: () {},
                            badgeContent: const Icon(Icons.add,
                                color: Colors.white, size: 10),
                            child: Container(
                              height: screenUtil.setHeight(50),
                              width: screenUtil.setHeight(50),
                              margin: EdgeInsets.symmetric(
                                  horizontal: screenUtil.setWidth(8)),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: screenUtil.setWidth(1),
                                    color: kGold),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: const NetImage(
                                  fit: BoxFit.cover,
                                  uri:
                                      "https://th.bing.com/th/id/OIG.gq_uOPPdJc81e_v0XAei",
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: screenUtil.setHeight(50),
                            width: screenUtil.setHeight(50),
                            margin: EdgeInsets.symmetric(
                                horizontal: screenUtil.setWidth(8)),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: screenUtil.setWidth(1), color: kGold),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: const NetImage(
                                fit: BoxFit.cover,
                                uri:
                                    "https://th.bing.com/th/id/OIG.gq_uOPPdJc81e_v0XAei",
                              ),
                            ),
                          );
                  },
                ),
              ),
              SizedBox(
                height: screenUtil.setHeight(15),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 20,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenUtil.setWidth(10),
                      vertical: screenUtil.setHeight(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: screenUtil.setHeight(50),
                              width: screenUtil.setHeight(50),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: screenUtil.setWidth(1),
                                    color: kGold),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: const NetImage(
                                    fit: BoxFit.cover,
                                    uri:
                                        "https://media.gcflearnfree.org/ctassets/topics/246/share_flower_fullsize.jpg",
                                  )),
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(12),
                            ),
                            TextUtil.secondaryText(
                              text: "sm0602",
                              color: kTextBody,
                              size: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            const Spacer(),
                            IconButton(
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
                                              Icons.report_gmailerrorred,
                                              color: kError,
                                              size: 28,
                                            ),
                                            SizedBox(
                                              width: screenUtil.setWidth(7),
                                            ),
                                            TextUtil.secondaryText(
                                              text: "Report",
                                              color: kError,
                                              size: 15,
                                              fontWeight: FontWeight.w500,
                                            )
                                          ],
                                        ),
                                        onPressed: (context) {}),
                                  ],
                                );
                              },
                              icon: const Icon(Icons.more_horiz),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(5),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(300),
                          child: const NetImage(
                            uri:
                                "https://miro.medium.com/v2/resize:fit:1400/1*YMJDp-kqus7i-ktWtksNjg.jpeg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(8),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.thumb_up_alt_outlined),
                            SizedBox(
                              width: screenUtil.setWidth(15),
                            ),
                            const Icon(Icons.message),
                            SizedBox(
                              width: screenUtil.setWidth(15),
                            ),
                            const Icon(Icons.cut_outlined),
                            SizedBox(
                              width: screenUtil.setWidth(15),
                            ),
                            const Icon(Icons.share),
                            const Spacer(),
                            TextUtil.secondaryText(
                              text: "23 hours ago",
                              color: kTextSubTitle,
                              size: 11,
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(8),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextUtil.secondaryText(
                              text: "107 likes",
                              color: kBlack,
                              size: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(10),
                            ),
                            TextUtil.secondaryText(
                              text: "5 faded points",
                              color: kBlack,
                              size: 12,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(8),
                        ),
                        TextUtil.secondaryText(
                          text:
                              "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          color: kBlack,
                          size: 12,
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(8),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: screenUtil.setHeight(20),
                              width: screenUtil.setHeight(20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: screenUtil.setWidth(1),
                                    color: kGold),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  ImageConst.appLogo,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(12),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextUtil.secondaryText(
                                  text: "sm0602",
                                  color: kTextBody,
                                  size: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: screenUtil.setHeight(2),
                                ),
                                TextUtil.secondaryText(
                                  text: "😍😍",
                                  color: kTextBody,
                                  size: 10,
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(5),
                        ),
                        GestureDetector(
                          onTap: () {
                            NavigatorUtil.push(context,
                                screen: const ViewAllCommentsScreen());
                          },
                          child: TextUtil.secondaryText(
                            text: "View all 10 comments",
                            color: kTextSubTitle,
                            size: 12,
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ColorTile extends StatelessWidget {
  final Color color;

  const ColorTile({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 600,
      child: Center(
        child: Text(
          color.toString(),
          style: TextStyle(
            color: color.computeLuminance() > 0.5 ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
