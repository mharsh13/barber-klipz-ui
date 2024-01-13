// ignore_for_file: use_build_context_synchronously
import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Screens/HomeScreen/Backend/Provider/home_screen_base_model.dart';
import 'package:barber_klipz_ui/Utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:story_maker/story_maker.dart';

class StoryCreatorScreen extends ConsumerStatefulWidget {
  const StoryCreatorScreen({super.key});

  @override
  ConsumerState<StoryCreatorScreen> createState() => _StoryCreatorScreenState();
}

class _StoryCreatorScreenState extends ConsumerState<StoryCreatorScreen> {
  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(homeScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: baseModel.storyImage != null
                ? StoryMaker(
                    filePath: baseModel.storyImage!.path,
                  )
                : Container(
                    color: kBlack,
                  ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenUtil.setWidth(10),
              vertical: screenUtil.setHeight(6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    print('-------------------------');
                    baseModel.setStoryFilter(context);
                  },
                  child: Column(
                    children: [
                      const Icon(Icons.filter_b_and_w_outlined),
                      SizedBox(
                        height: screenUtil.setHeight(3),
                      ),
                      TextUtil.secondaryText(
                        text: "Filter",
                        color: kBlack,
                        size: 11,
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Icon(Icons.sentiment_very_satisfied_outlined),
                    SizedBox(
                      height: screenUtil.setHeight(3),
                    ),
                    TextUtil.secondaryText(
                      text: "Sticker",
                      color: kBlack,
                      size: 11,
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.brush),
                    SizedBox(
                      height: screenUtil.setHeight(3),
                    ),
                    TextUtil.secondaryText(
                      text: "Filter",
                      color: kBlack,
                      size: 11,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
