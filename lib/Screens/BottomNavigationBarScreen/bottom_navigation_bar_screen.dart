import 'package:barber_klipz_ui/Screens/AddPostScreen/add_post_screen.dart';
import 'package:barber_klipz_ui/Screens/BottomNavigationBarScreen/Backend/Provider/bottom_navigation_bar_base_model.dart';
import 'package:barber_klipz_ui/Screens/CreateRoomScreens/public_create_room_screen.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:barber_klipz_ui/Utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/net_image.dart';

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
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 380,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  height: 6,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: kTextSubTitle,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: baseModel.screenUtil.setHeight(20),
                              ),
                              Center(
                                child: TextUtil.secondaryText(
                                  text: "Create Room",
                                  color: kBlack,
                                  size: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height: baseModel.screenUtil.setHeight(15),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: baseModel.screenUtil.setWidth(10),
                                ),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        NavigatorUtil.push(
                                          context,
                                          screen: const PublicCreateRoom(),
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            height: baseModel.screenUtil
                                                .setHeight(60),
                                            width: baseModel.screenUtil
                                                .setWidth(60),
                                            decoration: BoxDecoration(
                                              color: kGreen,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: const Icon(
                                              Icons.people_alt_rounded,
                                              color: kWhite,
                                            ),
                                          ),
                                          SizedBox(
                                            height: baseModel.screenUtil
                                                .setHeight(5),
                                          ),
                                          TextUtil.secondaryText(
                                            text: "Public\n open to everyone",
                                            color: kBlack,
                                            size: 11,
                                            fontWeight: FontWeight.w500,
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: baseModel.screenUtil.setWidth(15),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: baseModel.screenUtil
                                              .setHeight(60),
                                          width:
                                              baseModel.screenUtil.setWidth(60),
                                          decoration: BoxDecoration(
                                            color: kError,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Icon(
                                            Icons.star,
                                            color: kWhite,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              baseModel.screenUtil.setHeight(5),
                                        ),
                                        TextUtil.secondaryText(
                                          text: "Exclusive\nfor my subscribers",
                                          color: kBlack,
                                          size: 11,
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: baseModel.screenUtil.setWidth(15),
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          height: baseModel.screenUtil
                                              .setHeight(60),
                                          width:
                                              baseModel.screenUtil.setWidth(60),
                                          decoration: BoxDecoration(
                                            color: kBlack,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Icon(
                                            Icons.lock,
                                            color: kWhite,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              baseModel.screenUtil.setHeight(5),
                                        ),
                                        TextUtil.secondaryText(
                                          text: "Private\ninvite only",
                                          color: kBlack,
                                          size: 11,
                                          fontWeight: FontWeight.w500,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: baseModel.screenUtil.setHeight(20),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: baseModel.screenUtil.setWidth(30),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height:
                                          baseModel.screenUtil.setHeight(60),
                                      width: baseModel.screenUtil.setWidth(60),
                                      decoration: BoxDecoration(
                                        color: kCategoryText,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(
                                        Icons.fireplace_outlined,
                                        color: kWhite,
                                      ),
                                    ),
                                    SizedBox(
                                      height: baseModel.screenUtil.setHeight(5),
                                    ),
                                    TextUtil.secondaryText(
                                      text: "Inside\nmy camps",
                                      color: kBlack,
                                      size: 11,
                                      fontWeight: FontWeight.w500,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      const Icon(Icons.chat_outlined),
                      TextUtil.secondaryText(
                        text: "Audio",
                        color: kBlack,
                        size: 13,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
