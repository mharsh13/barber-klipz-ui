import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Resources/image_const.dart';
import 'package:barber_klipz_ui/Screens/InboxScreen/inbox_screen.dart';
import 'package:barber_klipz_ui/Screens/HomeScreen/Backend/Provider/home_screen_base_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:badges/badges.dart' as badges;

import '../../Utils/navigator_util.dart';
import '../../Utils/text_util.dart';

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
                  onPressed: () {},
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
                  onPressed: () {},
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
                onPressed: () {},
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
                                child: Image.asset(
                                  ImageConst.appLogo,
                                  fit: BoxFit.cover,
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
                                child: Image.asset(
                                  ImageConst.appLogo,
                                  fit: BoxFit.cover,
                                )),
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
                                child: Image.asset(
                                  ImageConst.appLogo,
                                  fit: BoxFit.cover,
                                ),
                              ),
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
                              onPressed: () {},
                              icon: const Icon(Icons.more_horiz),
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(5),
                        ),
                        SizedBox(
                          child: Image.asset(ImageConst.appLogo),
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
                        TextUtil.secondaryText(
                          text: "View all 10 comments",
                          color: kTextSubTitle,
                          size: 12,
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
