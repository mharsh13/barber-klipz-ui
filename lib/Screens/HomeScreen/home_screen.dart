import 'dart:io';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Resources/image_const.dart';
import 'package:barber_klipz_ui/Screens/AudioVideoChatRoomScreen/audio_video_chat_room_screen.dart';
import 'package:barber_klipz_ui/Screens/FadedPointsScreen/faded_points_screen.dart';
import 'package:barber_klipz_ui/Screens/HomeScreen/story_creator_screen.dart';
import 'package:barber_klipz_ui/Screens/HomeScreen/Backend/Provider/home_screen_base_model.dart';
import 'package:barber_klipz_ui/Screens/HomeScreen/story_view_screen.dart';
import 'package:barber_klipz_ui/Screens/InboxScreen/inbox_screen.dart';
import 'package:barber_klipz_ui/Screens/ViewAllCommentsScreen/Backend/Provider/view_all_comments_base_model.dart';
import 'package:barber_klipz_ui/Screens/ViewFlickzScreen/view_flickz_screen.dart';
import 'package:barber_klipz_ui/Utils/net_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:badges/badges.dart' as badges;
import 'package:story_maker/story_maker.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../Utils/navigator_util.dart';
import '../../Utils/text_util.dart';
import '../SplashScreen/Backend/Provider/splash_base_model.dart';
import '../ViewAllCommentsScreen/view_all_comments_screen.dart';
import 'image_source.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    final baseModel = ref.read(homeScreenBaseModel);
    final splashModel = ref.read(splashScreenBaseModel);
    if (splashModel.user == null) {
      splashModel.getMe(context);
    }
    getData(baseModel);
    super.initState();
  }

  void getData(HomeScreenBaseModel baseModel) async {
    await baseModel.getAllPosts(context).then((value) async {
      await baseModel.getAllUsersWithStories(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(homeScreenBaseModel);
    final splashBaseModel = ref.watch(splashScreenBaseModel);
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
          leadingWidth: screenUtil.setWidth(100),
          leading: Row(
            children: [
              IconButton(
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
              IconButton(
                icon: const Icon(
                  Icons.chat_outlined,
                  color: kWhite,
                ),
                onPressed: () {
                  NavigatorUtil.push(
                    context,
                    screen: const AudioVideoChatRoomScreen(),
                  );
                },
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.cut_outlined,
                color: kWhite,
              ),
              onPressed: () {
                NavigatorUtil.push(context, screen: const FadedPointsScreen());
              },
            ),
            IconButton(
              icon: const Icon(Icons.email_outlined),
              color: kWhite,
              onPressed: () {
                NavigatorUtil.push(context, screen: const InboxScreen());
              },
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
                    // ignore: sized_box_for_whitespace
                    Container(
                      alignment: Alignment.centerLeft,
                      height: screenUtil.setHeight(50),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: baseModel.allUsersWithStories.length + 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return index == 0
                              ? GestureDetector(
                                  onTap: () async {
                                    // baseModel.setIndex(0);
                                    baseModel
                                        .getAllStories(
                                            context, splashBaseModel.user!.id)
                                        .then((value) {
                                      if (value.isNotEmpty) {
                                        NavigatorUtil.push(
                                          context,
                                          screen: StoryViewScreen(
                                            user: splashBaseModel.user!,
                                            isMine: true,
                                          ),
                                        );
                                      }
                                    });
                                  },
                                  child: badges.Badge(
                                    position: badges.BadgePosition.bottomEnd(
                                      bottom: -1,
                                      end: 5,
                                    ),
                                    showBadge: true,
                                    badgeStyle: const badges.BadgeStyle(
                                      badgeColor: kYellow,
                                    ),
                                    onTap: () {
                                      baseModel.setStoryImageNull();
                                      imageSource(
                                        title: "Story",
                                        context: context,
                                        screenUtil: screenUtil,
                                        gallery: baseModel.selectGalleryImage,
                                      ).then(
                                        (value) async {
                                          if (baseModel.storyImage != null) {
                                            await Navigator.of(context)
                                                .push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    StoryMaker(
                                                  filePath: baseModel
                                                      .storyImage!.path,
                                                ),
                                              ),
                                            )
                                                .then((value) async {
                                              await baseModel.createStory(
                                                  context, value);
                                            });
                                          }
                                        },
                                      );
                                    },
                                    badgeContent: const Icon(Icons.add,
                                        color: Colors.white, size: 10),
                                    child: Container(
                                      height: screenUtil.setHeight(50),
                                      width: screenUtil.setHeight(50),
                                      margin: EdgeInsets.symmetric(
                                        horizontal: screenUtil.setWidth(8),
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            width: screenUtil.setWidth(1),
                                            color: kGold),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: NetImage(
                                          fit: BoxFit.cover,
                                          uri: splashBaseModel
                                                  .user?.profile_image ??
                                              '',
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    // baseModel.setIndex(0);
                                    baseModel
                                        .getAllStories(
                                            context,
                                            baseModel
                                                .allUsersWithStories[index - 1]
                                                .id)
                                        .then((value) {
                                      NavigatorUtil.push(
                                        context,
                                        screen: StoryViewScreen(
                                          user: baseModel
                                              .allUsersWithStories[index - 1],
                                          isMine: false,
                                        ),
                                      );
                                    });
                                  },
                                  child: Container(
                                    height: screenUtil.setHeight(50),
                                    width: screenUtil.setHeight(50),
                                    margin: EdgeInsets.symmetric(
                                      horizontal: screenUtil.setWidth(8),
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: screenUtil.setWidth(1),
                                        color: kGold,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: NetImage(
                                        fit: BoxFit.cover,
                                        uri: baseModel
                                            .allUsersWithStories[index - 1]
                                            .profile_image,
                                      ),
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
                      itemCount: baseModel.allPosts.length,
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
                                    height: screenUtil.setHeight(30),
                                    width: screenUtil.setHeight(30),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: screenUtil.setWidth(1),
                                          color: kGold),
                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: NetImage(
                                          fit: BoxFit.cover,
                                          uri: baseModel.allPosts[index].user
                                              .profile_image,
                                        )),
                                  ),
                                  SizedBox(
                                    width: screenUtil.setWidth(12),
                                  ),
                                  TextUtil.secondaryText(
                                    text: baseModel
                                        .allPosts[index].user.user_name,
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
                                            borderRadius:
                                                BorderRadius.circular(6),
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
                                            onPressed: (context) {},
                                          ),
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
                                child: NetImage(
                                  uri: baseModel.allPosts[index].media_url,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: screenUtil.setHeight(8),
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      baseModel.likeAndUnlikePost(
                                        context,
                                        baseModel.allPosts[index],
                                      );
                                    },
                                    child: baseModel.allPosts[index].liked
                                        ? const Icon(Icons.thumb_up_alt_rounded)
                                        : const Icon(
                                            Icons.thumb_up_alt_outlined),
                                  ),
                                  SizedBox(
                                    width: screenUtil.setWidth(15),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      NavigatorUtil.push(
                                        context,
                                        screen: ViewAllCommentsScreen(
                                          postModel: baseModel.allPosts[index],
                                        ),
                                      );
                                    },
                                    child: const Icon(Icons.message),
                                  ),
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
                                    text: timeago.format(DateTime.parse(
                                        baseModel.allPosts[index].created_at)),
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
                                    text:
                                        "${baseModel.allPosts[index].likes_count} likes",
                                    color: kBlack,
                                    size: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  SizedBox(
                                    width: screenUtil.setWidth(10),
                                  ),
                                  TextUtil.secondaryText(
                                    text:
                                        "${baseModel.allPosts[index].loves_count} faded points",
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
                                text: baseModel.allPosts[index].caption,
                                color: kBlack,
                                size: 12,
                              ),
                              SizedBox(
                                height: screenUtil.setHeight(8),
                              ),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Container(
                              //       height: screenUtil.setHeight(20),
                              //       width: screenUtil.setHeight(20),
                              //       decoration: BoxDecoration(
                              //         shape: BoxShape.circle,
                              //         border: Border.all(
                              //             width: screenUtil.setWidth(1),
                              //             color: kGold),
                              //       ),
                              //       child: ClipRRect(
                              //         borderRadius: BorderRadius.circular(50),
                              //         child: Image.asset(
                              //           ImageConst.appLogo,
                              //           fit: BoxFit.cover,
                              //         ),
                              //       ),
                              //     ),
                              //     SizedBox(
                              //       width: screenUtil.setWidth(12),
                              //     ),
                              //     Column(
                              //       crossAxisAlignment:
                              //           CrossAxisAlignment.start,
                              //       children: [
                              //         TextUtil.secondaryText(
                              //           text: "sm0602",
                              //           color: kTextBody,
                              //           size: 11,
                              //           fontWeight: FontWeight.w500,
                              //         ),
                              //         SizedBox(
                              //           height: screenUtil.setHeight(2),
                              //         ),
                              //         TextUtil.secondaryText(
                              //           text: "😍😍",
                              //           color: kTextBody,
                              //           size: 10,
                              //         )
                              //       ],
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: screenUtil.setHeight(5),
                              // ),
                              baseModel.allPosts[index].comments_count > 0
                                  ? GestureDetector(
                                      onTap: () {
                                        NavigatorUtil.push(
                                          context,
                                          screen: ViewAllCommentsScreen(
                                            postModel:
                                                baseModel.allPosts[index],
                                          ),
                                        );
                                      },
                                      child: TextUtil.secondaryText(
                                        text:
                                            "View all ${baseModel.allPosts[index].comments_count} comments",
                                        color: kTextSubTitle,
                                        size: 12,
                                      ),
                                    )
                                  : Container()
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
