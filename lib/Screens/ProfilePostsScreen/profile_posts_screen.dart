import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:barber_klipz_ui/Resources/color_const.dart';
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
                                          uri: splashBaseModel
                                                  .user!.profile_image ??
                                              "",
                                        )),
                                  ),
                                  SizedBox(
                                    width: screenUtil.setWidth(12),
                                  ),
                                  TextUtil.secondaryText(
                                    text: splashBaseModel.user!.user_name,
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
                                      // baseModel.likeAndUnlikePost(
                                      //   context,
                                      //   baseModel.allPosts[index],
                                      // );
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
                                      // NavigatorUtil.push(
                                      //   context,
                                      //   screen: ViewAllCommentsScreen(
                                      //     postModel: baseModel.allPosts[index],
                                      //   ),
                                      // );
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
                                        // NavigatorUtil.push(
                                        //   context,
                                        //   screen: ViewAllCommentsScreen(
                                        //     postModel:
                                        //         baseModel.allPosts[index],
                                        //   ),
                                        // );
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
