import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Screens/SingleAudioVideoRoomScreen/Backend/Provider/single_audio_video_room_base_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Utils/net_image.dart';
import '../../Utils/text_util.dart';

class SingleAudioVideoRoomScreen extends ConsumerWidget {
  const SingleAudioVideoRoomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseModel = ref.watch(singleAudioVideoRoomBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      bottomNavigationBar: Container(
        color: kBackground,
        padding: EdgeInsets.symmetric(
          vertical: screenUtil.setHeight(12),
          horizontal: screenUtil.setWidth(10),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: screenUtil.setWidth(110),
                height: screenUtil.setHeight(30),
                decoration: BoxDecoration(
                  border: Border.all(color: kYellow, width: 1.5),
                  borderRadius: BorderRadius.circular(
                    screenUtil.setSp(100),
                  ),
                ),
                child: Center(
                  child: TextUtil.primaryText(
                    text: "Ghost Out 👻",
                    color: kBlack,
                    size: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: screenUtil.setHeight(30),
              width: screenUtil.setHeight(30),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kGrey,
              ),
              child: const Icon(
                Icons.chat_outlined,
                size: 20,
              ),
            ),
            SizedBox(
              width: screenUtil.setWidth(8),
            ),
            Container(
              height: screenUtil.setHeight(30),
              width: screenUtil.setHeight(30),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kGrey,
              ),
              child: Icon(
                Icons.favorite,
                size: 20,
                color: kError.withOpacity(0.6),
              ),
            ),
            SizedBox(
              width: screenUtil.setWidth(8),
            ),
            Container(
              height: screenUtil.setHeight(30),
              width: screenUtil.setHeight(30),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kGrey,
              ),
              child: const Icon(
                Icons.add,
                size: 20,
              ),
            ),
            SizedBox(
              width: screenUtil.setWidth(8),
            ),
            Container(
              height: screenUtil.setHeight(30),
              width: screenUtil.setHeight(30),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kGrey,
              ),
              child: Icon(
                Icons.back_hand_outlined,
                color: kBlack.withOpacity(0.7),
                size: 20,
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: "All Rooms",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: false,
        leadingWidth: screenUtil.setWidth(35),
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: kWhite,
            size: 32,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          const Icon(
            Icons.person,
            color: kWhite,
          ),
          SizedBox(
            width: screenUtil.setWidth(5),
          ),
          TextUtil.secondaryText(
            text: "24",
            color: kWhite,
            size: 13,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            width: screenUtil.setWidth(10),
          ),
          Icon(
            Icons.favorite,
            color: kError.withOpacity(0.8),
          ),
          SizedBox(
            width: screenUtil.setWidth(5),
          ),
          TextUtil.secondaryText(
            text: "0",
            color: kWhite,
            size: 13,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(
            width: screenUtil.setWidth(10),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            width: screenUtil.setHeight(30),
            height: screenUtil.setHeight(30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const NetImage(
                uri:
                    "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
              ),
            ),
          ),
          SizedBox(
            width: screenUtil.setWidth(8),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenUtil.setWidth(18),
            vertical: screenUtil.setHeight(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: screenUtil.setWidth(210),
                    child: TextUtil.secondaryText(
                      text:
                          "As they rounded a bend in the path that ran beside the very very very very very very",
                      color: kBlack,
                      size: 13,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: screenUtil.setWidth(8),
                  ),
                  Container(
                    width: screenUtil.setWidth(75),
                    height: screenUtil.setHeight(30),
                    padding: EdgeInsets.symmetric(
                        horizontal: screenUtil.setWidth(2)),
                    decoration: BoxDecoration(
                      border: Border.all(color: kYellow, width: 1.5),
                      borderRadius: BorderRadius.circular(
                        screenUtil.setSp(100),
                      ),
                    ),
                    child: Center(
                      child: TextUtil.primaryText(
                        text: "Join Camp",
                        color: kBlack,
                        size: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz_outlined)
                ],
              ),
              SizedBox(
                height: screenUtil.setHeight(8),
              ),
              TextUtil.secondaryText(
                text: "What do you have to offer?",
                color: kBlack,
                size: 13,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: screenUtil.setHeight(24),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 14,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 3,
                  mainAxisExtent: screenUtil.setHeight(120),
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        width: screenUtil.setHeight(78),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              width: screenUtil.setHeight(70),
                              height: screenUtil.setHeight(70),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: const NetImage(
                                  uri:
                                      "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
                                ),
                              ),
                            ),
                            Positioned(
                              left: 60,
                              bottom: 2,
                              child: Container(
                                width: screenUtil.setHeight(23),
                                height: screenUtil.setHeight(23),
                                decoration: BoxDecoration(
                                  color: kGrey.withOpacity(0.8),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.mic_off,
                                  color: kBlack,
                                  size: 20,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 60,
                              child: Container(
                                width: screenUtil.setHeight(23),
                                height: screenUtil.setHeight(23),
                                decoration: BoxDecoration(
                                  color: kGrey.withOpacity(0.8),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.favorite_border_outlined,
                                  color: kBlack,
                                  size: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(3),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtil.secondaryText(
                            text: "💁🏻‍♀️ Cassie",
                            color: kBlack,
                            size: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
              TextUtil.secondaryText(
                text: "Others in the Room",
                color: kBlack,
                size: 13,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                height: screenUtil.setHeight(20),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 3,
                  mainAxisExtent: screenUtil.setHeight(120),
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        width: screenUtil.setHeight(78),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          width: screenUtil.setHeight(72),
                          height: screenUtil.setHeight(75),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: const NetImage(
                              uri:
                                  "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(3),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextUtil.secondaryText(
                            text: "💁🏻‍♀️ Cassie",
                            color: kBlack,
                            size: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
