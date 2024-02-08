// ignore_for_file: non_constant_identifier_names

import 'package:barber_klipz_ui/Providers/chat_base_model.dart';
import 'package:barber_klipz_ui/Screens/DirectMessageScreen/Backend/Provider/direct_message_base_model.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Models/user_model.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Provider/splash_base_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../Resources/color_const.dart';
import '../../Utils/net_image.dart';
import '../../Utils/text_util.dart';

class DirectMessageScreen extends ConsumerStatefulWidget {
  const DirectMessageScreen(
      {super.key,
      required this.id,
      required this.profile_image,
      required this.user_name});
  final String id;
  final String profile_image;
  final String user_name;

  @override
  ConsumerState<DirectMessageScreen> createState() =>
      _DirectMessageScreenState();
}

class _DirectMessageScreenState extends ConsumerState<DirectMessageScreen> {
  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(directMessageBaseModel);
    final splashModel = ref.watch(splashScreenBaseModel);
    final chatModel = ref.watch(chatBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack,
        leading: const BackButton(
          color: kWhite,
        ),
        title: Row(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              width: screenUtil.setHeight(30),
              height: screenUtil.setHeight(30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: NetImage(
                  uri: widget.profile_image,
                ),
              ),
            ),
            SizedBox(
              width: screenUtil.setWidth(10),
            ),
            TextUtil.secondaryText(
              text: widget.user_name,
              color: kGold,
              size: 14,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: screenUtil.setHeight(130)),
              child: TextUtil.secondaryText(
                text: DateFormat('MMM d, h:mm a').format(DateTime.now()),
                color: kTextSubTitle,
                size: 11,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(bottom: screenUtil.setHeight(70)),
              padding: EdgeInsets.only(
                right: screenUtil.setWidth(0),
                left: screenUtil.setWidth(12),
                top: screenUtil.setHeight(16),
              ),
              child: Row(
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    width: screenUtil.setHeight(30),
                    height: screenUtil.setHeight(30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: NetImage(
                        uri: widget.profile_image,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenUtil.setWidth(8),
                  ),
                  Container(
                    constraints:
                        BoxConstraints(maxWidth: screenUtil.setWidth(250)),
                    decoration: BoxDecoration(
                      color: kBackgroundGrey,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(screenUtil.setSp(13)),
                        bottomLeft: Radius.circular(screenUtil.setSp(0)),
                        topLeft: Radius.circular(screenUtil.setSp(13)),
                        bottomRight: Radius.circular(screenUtil.setSp(13)),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenUtil.setWidth(15),
                        vertical: screenUtil.setHeight(10),
                      ),
                      child: TextUtil.secondaryText(
                        text: "Helloooooooo",
                        color: kTextTitle,
                        size: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenUtil.setWidth(10),
              vertical: screenUtil.setHeight(10),
            ),
            width: screenUtil.screenWidth,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: TextField(
                onSubmitted: (value) {
                  print('--------------------------------------');
                  print(value);
                  print('--------------------------------------');
                  chatModel.emitMessage(
                    value,
                    splashModel.user!.id,
                    widget.id,
                    context,
                  );
                  baseModel.enterMessage.clear();
                },
                textInputAction: TextInputAction.send,
                controller: baseModel.enterMessage,
                cursorColor: kBlack,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(top: 13, bottom: 13, left: 10),
                  hintText: "Type a message",
                  hintStyle: const TextStyle(
                    fontSize: 16,
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: screenUtil.setWidth(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Icon(
                          Icons.keyboard_voice_sharp,
                          size: 28,
                        ),
                        SizedBox(
                          width: screenUtil.setWidth(5),
                        ),
                        baseModel.enterMessage.text.isEmpty ||
                                baseModel.enterMessage.text == ""
                            ? const Icon(
                                Icons.image_outlined,
                                size: 28,
                              )
                            : TextUtil.secondaryText(
                                text: "Send",
                                color: kGold,
                                size: 15,
                                fontWeight: FontWeight.w500,
                              )
                      ],
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.camera_alt_rounded,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
