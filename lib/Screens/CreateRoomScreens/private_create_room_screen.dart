import 'package:barber_klipz_ui/Screens/CreateRoomScreens/Backend/Provider/create_room_base_model.dart';
import 'package:barber_klipz_ui/Screens/CreateRoomScreens/with_create_room_screen.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/text_util.dart';

class PrivateCreateRoomScreen extends ConsumerWidget {
  const PrivateCreateRoomScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseModel = ref.watch(createRoomBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: "Create Room",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        leading: const BackButton(
          color: kWhite,
        ),
        leadingWidth: screenUtil.setWidth(25),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: screenUtil.setWidth(10),
            ),
            child: GestureDetector(
              onTap: () {
                NavigatorUtil.push(
                  context,
                  screen: const WithCreateRoomScreen(),
                );
              },
              child: TextUtil.secondaryText(
                text: "Next",
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
            vertical: screenUtil.setHeight(10),
            horizontal: screenUtil.setWidth(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextUtil.secondaryText(
                    text: "Title",
                    color: kBlack,
                    size: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    width: screenUtil.setWidth(5),
                  ),
                  Container(
                    width: screenUtil.screenWidth - 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextFormField(
                      controller: baseModel.privateTitle,
                      cursorColor: kBlack,
                      keyboardType: TextInputType.text,
                      style: TextUtil.textStyle(
                        color: kTextBody,
                        fontSize: screenUtil.setSp(15),
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        constraints: BoxConstraints(
                          minHeight: screenUtil.setHeight(38),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide.none,
                        ),
                        isDense: true,
                        errorStyle: const TextStyle(color: Colors.amberAccent),
                        contentPadding: const EdgeInsets.only(
                          top: 13,
                          bottom: 13,
                          left: 10,
                        ),
                        hintText: "Keep your title short and sweet",
                        hintStyle: TextUtil.textStyle(
                          color: kHintText,
                          fontSize: screenUtil.setHeight(12),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: kBackgroundDropDown,
              ),
              SizedBox(
                height: screenUtil.setHeight(5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextUtil.secondaryText(
                        text: "Interest",
                        color: kBlack,
                        size: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                        color: kBlack,
                      )
                    ],
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(7),
                  ),
                  TextUtil.secondaryText(
                    text: "Add interests to boost your content discoverability",
                    color: kHintText,
                    size: 12,
                  ),
                ],
              ),
              const Divider(
                color: kBackgroundDropDown,
              ),
              SizedBox(
                height: screenUtil.setHeight(5),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtil.secondaryText(
                    text: "Room Type",
                    color: kBlack,
                    size: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(10),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenUtil.setWidth(10),
                        ),
                        height: screenUtil.setHeight(30),
                        decoration: BoxDecoration(
                          color: kHintText.withOpacity(0.7),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              screenUtil.setSp(30),
                            ),
                          ),
                        ),
                        child: Center(
                          child: TextUtil.secondaryText(
                            text: "Public",
                            fontWeight: FontWeight.w500,
                            color: kWhite,
                            size: screenUtil.setHeight(11),
                            lineHeight: 1,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenUtil.setWidth(8),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenUtil.setWidth(10),
                        ),
                        height: screenUtil.setHeight(30),
                        decoration: BoxDecoration(
                          color: kHintText.withOpacity(0.7),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              screenUtil.setSp(30),
                            ),
                          ),
                        ),
                        child: Center(
                          child: TextUtil.secondaryText(
                            text: "Exclusive",
                            fontWeight: FontWeight.w500,
                            color: kWhite,
                            size: screenUtil.setHeight(11),
                            lineHeight: 1,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenUtil.setWidth(8),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenUtil.setWidth(10),
                        ),
                        height: screenUtil.setHeight(30),
                        decoration: BoxDecoration(
                          color: kBlack,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              screenUtil.setSp(30),
                            ),
                          ),
                        ),
                        child: Center(
                          child: TextUtil.secondaryText(
                            text: "Private",
                            fontWeight: FontWeight.w500,
                            color: kWhite,
                            size: screenUtil.setHeight(11),
                            lineHeight: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(10),
                  ),
                  TextUtil.secondaryText(
                    text: "Just for you and your friends.",
                    color: kHintText,
                    size: 12,
                  ),
                ],
              ),
              const Divider(
                color: kBackgroundDropDown,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextUtil.secondaryText(
                        text: "Add Tags",
                        color: kBlack,
                        size: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(
                        width: screenUtil.setWidth(5),
                      ),
                      Container(
                        width: screenUtil.screenWidth - 109,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: TextFormField(
                          controller: baseModel.privateTags,
                          cursorColor: kBlack,
                          keyboardType: TextInputType.text,
                          style: TextUtil.textStyle(
                            color: kTextBody,
                            fontSize: screenUtil.setSp(15),
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            constraints: BoxConstraints(
                              minHeight: screenUtil.setHeight(38),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            errorStyle:
                                const TextStyle(color: Colors.amberAccent),
                            contentPadding: const EdgeInsets.only(
                              top: 13,
                              bottom: 13,
                              left: 10,
                            ),
                            hintText: "#creators",
                            hintStyle: TextUtil.textStyle(
                              color: kHintText,
                              fontSize: screenUtil.setHeight(12),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextUtil.secondaryText(
                    text:
                        "By adding tags to your content you will get more visibility on Barber Klipz",
                    color: kHintText,
                    size: 12,
                  ),
                ],
              ),
              const Divider(
                color: kBackgroundDropDown,
              ),
              SizedBox(
                height: screenUtil.setHeight(5),
              ),
              Row(
                children: [
                  TextUtil.secondaryText(
                    text: "Allow in-room chats",
                    color: kBlack,
                    size: 15,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 55,
                    height: 34,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: CupertinoSwitch(
                        value: baseModel.privateInRoomChats,
                        activeColor: kYellow,
                        trackColor: kGrey,
                        thumbColor: kWhite,
                        onChanged: (value) {
                          baseModel.enablePrivateInRoomChats(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
