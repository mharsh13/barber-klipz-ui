import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Screens/HomeScreen/Backend/Provider/home_screen_base_model.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Models/user_model.dart';
import 'package:barber_klipz_ui/Utils/net_image.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_view/story_view.dart';

import '../../Utils/text_util.dart';

class StoryViewScreen extends ConsumerStatefulWidget {
  const StoryViewScreen({super.key, required this.user});

  final UserModel user;

  @override
  ConsumerState<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends ConsumerState<StoryViewScreen> {
  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(homeScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      body: Stack(
        children: [
          StoryView(
            controller: baseModel.controller,
            storyItems: [
              StoryItem.pageImage(
                url:
                    "https://fastly.picsum.photos/id/378/200/300.jpg?hmac=j3b_pCH-0kwk0RstB5_LzJ2hw4H53kPLf6v5M-D3FaI",
                controller: baseModel.controller,
                duration: const Duration(seconds: 15),
              ),
              StoryItem.pageImage(
                url:
                    "https://fastly.picsum.photos/id/378/200/300.jpg?hmac=j3b_pCH-0kwk0RstB5_LzJ2hw4H53kPLf6v5M-D3FaI",
                controller: baseModel.controller,
                duration: const Duration(seconds: 15),
              ),
              // Add more StoryItem widgets as needed
            ],
            onComplete: () {
              Navigator.of(context).pop();
              // Navigate to the next screen or perform any other action upon completion
            },
            onVerticalSwipeComplete: (direction) {
              if (direction == Direction.down) {
                Navigator.pop(context); // Navigate back when swiped down
              }
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      TextUtil.secondaryText(
                        text: widget.user.user_name,
                        color: kWhite,
                        size: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Row(
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
                        text: '0',
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
                              text: '0',
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
