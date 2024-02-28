import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Screens/HomeScreen/Backend/Provider/home_screen_base_model.dart';
import 'package:barber_klipz_ui/Screens/HomeScreen/viewers_screen.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Models/user_model.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:barber_klipz_ui/Utils/net_image.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';
import 'package:flutter_story_view/flutter_story_view.dart';
import 'package:flutter_story_view/models/story_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Utils/text_util.dart';

class StoryViewScreen extends ConsumerStatefulWidget {
  const StoryViewScreen({super.key, required this.user, required this.isMine});
  final UserModel user;
  final bool isMine;

  @override
  ConsumerState<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends ConsumerState<StoryViewScreen> {
  @override
  void initState() {
    final baseModel = ref.read(homeScreenBaseModel);
    baseModel.setIndex(0);
    baseModel.viewStory(context, baseModel.allStories[baseModel.currentPage]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(homeScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      bottomSheet: widget.isMine
          ? null
          : Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(10),
                vertical: screenUtil.setHeight(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(7),
                      child: TextFormField(
                        maxLines: 3,
                        minLines: 1,
                        controller: baseModel.replyStory,
                        cursorColor: kBlack,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                              top: 13, bottom: 13, left: 10),
                          hintText: "Type a message",
                          hintStyle: const TextStyle(
                            fontSize: 16,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () async {},
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: screenUtil.setWidth(10),
                                top: screenUtil.setHeight(12),
                              ),
                              child: TextUtil.secondaryText(
                                text: "Send",
                                color: kCategoryText,
                                size: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      baseModel.likeAndUnlikeStory(
                          context, baseModel.allStories[baseModel.currentPage]);
                    },
                    icon: baseModel.allStories[baseModel.currentPage].liked
                        ? const Icon(
                            Icons.favorite,
                            color: kError,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: kError,
                          ),
                  ),
                ],
              ),
            ),
      body: Stack(
        children: [
          FlutterStoryView(
            // controller: baseModel.controller,
            onPageChanged: (index) {
              baseModel.setIndex(index);
              baseModel.viewStory(context, baseModel.allStories[index]);
            },
            storyItems: baseModel.allStories
                .map(
                  (e) => StoryItem(
                    url: e.media_url,
                    type: StoryItemType.image,
                    duration: 15,
                  ),
                )
                .toList(),
            onComplete: () {
              Navigator.of(context).pop();
              // Navigate to the next screen or perform any other action upon completion
            },
          ),
          Positioned(
            top: screenUtil.setHeight(50),
            left: screenUtil.setWidth(10),
            child: Container(
              width: screenUtil.screenWidth,
              padding: EdgeInsets.only(right: screenUtil.setWidth(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: screenUtil.setHeight(25),
                        width: screenUtil.setHeight(25),
                        margin: EdgeInsets.symmetric(
                          horizontal: screenUtil.setWidth(8),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: NetImage(
                            fit: BoxFit.cover,
                            uri: widget.user.profile_image,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TextUtil.secondaryText(
                                text: widget.user.user_name,
                                color: kWhite,
                                size: 15,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: screenUtil.screenWidth - 184,
                              ),
                              GestureDetector(
                                onTap: () {
                                  NavigatorUtil.push(context,
                                      screen: const ViewersScreen());
                                },
                                child: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: kWhite,
                                ),
                              )
                            ],
                          ),
                          TextUtil.secondaryText(
                            text: timeago.format(DateTime.parse(baseModel
                                .allStories[baseModel.currentPage].created_at)),
                            color: kGrey,
                            size: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      )
                    ],
                  ),
                  !widget.isMine
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: kError,
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(4),
                            ),
                            TextUtil.secondaryText(
                              text: baseModel
                                  .allStories[baseModel.currentPage].likes_count
                                  .toString(),
                              color: kWhite,
                              size: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(20),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenUtil.setHeight(10),
                                vertical: screenUtil.setWidth(2),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.remove_red_eye_sharp,
                                    color: kWhite,
                                  ),
                                  SizedBox(
                                    width: screenUtil.setWidth(4),
                                  ),
                                  TextUtil.secondaryText(
                                    text: baseModel
                                        .allStories[baseModel.currentPage]
                                        .views_count
                                        .toString(),
                                    color: kWhite,
                                    size: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
