import 'package:barber_klipz_ui/Screens/CreateRoomScreens/Backend/Provider/create_room_base_model.dart';
import 'package:barber_klipz_ui/Screens/SingleAudioVideoRoomScreen/single_audio_video_room_screen.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:badges/badges.dart' as badges;

import '../../Resources/color_const.dart';
import '../../Utils/net_image.dart';
import '../../Utils/text_util.dart';

class WithCreateRoomScreen extends ConsumerWidget {
  const WithCreateRoomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseModel = ref.watch(createRoomBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: "With",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        leading: const BackButton(
          color: kWhite,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: screenUtil.setWidth(10),
            ),
            child: GestureDetector(
              onTap: () {
                NavigatorUtil.push(
                  context,
                  screen: const SingleAudioVideoRoomScreen(),
                );
              },
              child: TextUtil.secondaryText(
                text: "Create",
                color: kWhite,
                size: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenUtil.setWidth(10),
            vertical: screenUtil.setHeight(15),
          ),
          child: Column(
            children: [
              Container(
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
              SizedBox(
                height: screenUtil.setHeight(25),
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 35,
                  mainAxisSpacing: 30,
                  mainAxisExtent: screenUtil.setHeight(60),
                ),
                itemBuilder: (context, index) {
                  return badges.Badge(
                    position: badges.BadgePosition.bottomEnd(
                      bottom: -1,
                      end: 30,
                    ),
                    showBadge: true,
                    badgeStyle: const badges.BadgeStyle(
                      badgeColor: kGrey,
                    ),
                    onTap: () {},
                    badgeContent: const Icon(
                      Icons.add,
                      color: kBlack,
                      size: 12,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(70),
                      ),
                      width: screenUtil.setWidth(60),
                      height: screenUtil.setHeight(60),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: const NetImage(
                          uri:
                              "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
                        ),
                      ),
                    ),
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
