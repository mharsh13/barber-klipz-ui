import 'package:barber_klipz_ui/Screens/AudioVideoChatRoomScreen/Backend/Provider/audio_video_chat_room_base_model.dart';
import 'package:barber_klipz_ui/Screens/SingleAudioVideoRoomScreen/single_audio_video_room_screen.dart';
import 'package:barber_klipz_ui/Utils/button_util.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:barber_klipz_ui/Utils/net_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

import '../../Resources/color_const.dart';
import '../../Utils/text_util.dart';

class AudioVideoChatRoomScreen extends ConsumerWidget {
  const AudioVideoChatRoomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseModel = ref.watch(audioVideoChatRoomBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: Row(
          children: [
            TextUtil.secondaryText(
              text: "Barber Klipz",
              color: kGold,
              size: 18,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              width: screenUtil.setWidth(5),
            ),
            const Icon(
              Icons.chat_outlined,
              color: kGold,
              size: 20,
            ),
          ],
        ),
        centerTitle: true,
        leading: const BackButton(
          color: kWhite,
        ),
        leadingWidth: screenUtil.setWidth(20),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.fireplace_outlined,
              color: kWhite,
            ),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonUtil.smallButtonUtil(
        text: "Create Room",
        screenUtil: screenUtil,
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: screenUtil.setHeight(40),
              decoration: BoxDecoration(
                color: kBackgroundDropDown,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextFormField(
                cursorColor: kBlack,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.only(top: 13, bottom: 13, left: 10),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    NavigatorUtil.push(context,
                        screen: const SingleAudioVideoRoomScreen());
                  },
                  child: Container(
                    foregroundDecoration:
                        const RotatedCornerDecoration.withColor(
                      color: kLicorice,
                      spanBaselineShift: 4,
                      badgeSize: Size(64, 64),
                      badgeCornerRadius: Radius.circular(8),
                      badgePosition: BadgePosition.topEnd,
                      textSpan: TextSpan(
                        text: '⭐️⭐️⭐️',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                                color: Colors.yellowAccent, blurRadius: 8),
                          ],
                        ),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      top: screenUtil.setHeight(8),
                      bottom: screenUtil.setHeight(20),
                      left: screenUtil.setWidth(15),
                      right: screenUtil.setWidth(15),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: screenUtil.setWidth(13),
                      vertical: screenUtil.setHeight(15),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(2, 4),
                          blurRadius: 12.0,
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                        ),
                      ],
                      color: kWhite,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextUtil.secondaryText(
                              text: "Audio/Video Room",
                              color: kBlack,
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(5),
                            ),
                            const Icon(
                              Icons.fireplace_outlined,
                              color: kYellow,
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(8),
                        ),
                        TextUtil.secondaryText(
                          text: "Startup or MNC's",
                          color: kBlack,
                          size: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(20),
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: screenUtil.setWidth(67),
                                  height: screenUtil.setHeight(60),
                                  child: Stack(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: screenUtil.setWidth(1),
                                            color: kTextSubTitle,
                                          ),
                                        ),
                                        height: screenUtil.setHeight(40),
                                        width: screenUtil.setHeight(40),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            screenUtil.setSp(60),
                                          ),
                                          child: const NetImage(
                                            fit: BoxFit.cover,
                                            uri:
                                                "https://cdn-icons-png.flaticon.com/512/4515/4515630.png",
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        left: 25,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              width: screenUtil.setWidth(1),
                                              color: kTextSubTitle,
                                            ),
                                          ),
                                          height: screenUtil.setHeight(40),
                                          width: screenUtil.setHeight(40),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                screenUtil.setSp(60)),
                                            child: const NetImage(
                                              fit: BoxFit.cover,
                                              uri:
                                                  "https://cdn1.iconfinder.com/data/icons/user-pictures/101/malecostume-512.png",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(40),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextUtil.secondaryText(
                                  text: "George",
                                  color: kTextSubTitle,
                                  size: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                TextUtil.secondaryText(
                                  text: "Sofia",
                                  color: kTextSubTitle,
                                  size: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                TextUtil.secondaryText(
                                  text: "Regina",
                                  color: kTextSubTitle,
                                  size: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                TextUtil.secondaryText(
                                  text: "Valentina",
                                  color: kTextSubTitle,
                                  size: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(30),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextUtil.secondaryText(
                                  text: "Isabella",
                                  color: kTextSubTitle,
                                  size: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                TextUtil.secondaryText(
                                  text: "Natalia",
                                  color: kTextSubTitle,
                                  size: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                TextUtil.secondaryText(
                                  text: "Renata",
                                  color: kTextSubTitle,
                                  size: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                                TextUtil.secondaryText(
                                  text: "and 2 more",
                                  color: kTextSubTitle,
                                  size: 11,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(20),
                        ),
                        Row(
                          children: [
                            TextUtil.secondaryText(
                              text: "17",
                              color: kTextSubTitle,
                              size: 12,
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(3),
                            ),
                            const Icon(
                              Icons.person,
                              color: kTextSubTitle,
                              size: 20,
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(5),
                            ),
                            TextUtil.secondaryText(
                              text: "/",
                              color: kTextSubTitle,
                              size: 12,
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(5),
                            ),
                            const Icon(
                              Icons.chat_bubble_rounded,
                              color: kTextSubTitle,
                              size: 18,
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(3),
                            ),
                            TextUtil.secondaryText(
                              text: "17",
                              color: kTextSubTitle,
                              size: 12,
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(25),
                            ),
                            ButtonUtil.microButtonUtil(
                                text: "Unlock",
                                screenUtil: screenUtil,
                                onPressed: () {}),
                            SizedBox(
                              width: screenUtil.setWidth(8),
                            ),
                            ButtonUtil.microButtonUtil(
                                text: "Subscribe",
                                screenUtil: screenUtil,
                                onPressed: () {}),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
