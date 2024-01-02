import 'package:barber_klipz_ui/Screens/AddPostScreen/add_post_screen.dart';
import 'package:barber_klipz_ui/Screens/BottomNavigationBarScreen/Backend/Provider/bottom_navigation_bar_base_model.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:barber_klipz_ui/Utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';

class BottomNavigationBarScreen extends ConsumerStatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  ConsumerState<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState
    extends ConsumerState<BottomNavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(bottomNavigationBarBaseModel);
    return Scaffold(
      body: baseModel.screens[baseModel.currentIndex],
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          elevation: 30,
          items: baseModel.navBarItems(),
          currentIndex: baseModel.currentIndex,
          onTap: (index) {
            if (index == 2) {
              _showPopup(context, baseModel);
            } else {
              baseModel.setIndex(index);
            }
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kWhite,
          selectedFontSize: 0,
          iconSize: 0,
          unselectedFontSize: 0,
        ),
      ),
    );
  }

  void _showPopup(
      BuildContext context, BottomNavigationBarBaseModel baseModel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kWhite,
          surfaceTintColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 82),
          contentPadding: const EdgeInsets.all(18),
          content: SizedBox(
            height: baseModel.screenUtil.setHeight(100),
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: baseModel.screenUtil.setWidth(10),
              mainAxisSpacing: baseModel.screenUtil.setHeight(15),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                GestureDetector(
                  onTap: () {
                    NavigatorUtil.push(context, screen: const AddPostScreen());
                  },
                  child: Column(
                    children: [
                      const Icon(Icons.grid_on),
                      TextUtil.secondaryText(
                        text: "Post",
                        color: kBlack,
                        size: 13,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Icon(Icons.add_circle_outline_outlined),
                    TextUtil.secondaryText(
                      text: "Story",
                      color: kBlack,
                      size: 13,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.live_tv_rounded),
                    TextUtil.secondaryText(
                      text: "Live",
                      color: kBlack,
                      size: 13,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.movie_creation_outlined),
                    TextUtil.secondaryText(
                      text: "Flickz",
                      color: kBlack,
                      size: 13,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.chat_outlined),
                    TextUtil.secondaryText(
                      text: "Audio",
                      color: kBlack,
                      size: 13,
                      fontWeight: FontWeight.w500,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
