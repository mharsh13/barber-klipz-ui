// ignore_for_file: non_constant_identifier_names

import 'package:barber_klipz_ui/Models/message_model.dart';
import 'package:barber_klipz_ui/Providers/chat_base_model.dart';
import 'package:barber_klipz_ui/Screens/DirectMessageScreen/Backend/Provider/direct_message_base_model.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Provider/splash_base_model.dart';
import 'package:barber_klipz_ui/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/screen_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../Resources/color_const.dart';
import '../../Utils/net_image.dart';
import '../../Utils/text_util.dart';
import 'Components/image_source.dart';
import 'Components/sender_bubble.dart';

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
  void initState() {
    final baseModel = ref.read(directMessageBaseModel);
    final chatModel = ref.read(chatBaseModel);
    final splashModel = ref.read(splashScreenBaseModel);

    chatModel.socket!.on('message', (data) {
      baseModel.addMessage(
        MessageModel(
          id: data['id'],
          senderId: data['senderId'],
          receiverId: data['receiverId'],
          message: data['message'],
          messageType: data['messageType'],
          createdAt: data['createdAt'],
          seen: data['seen'],
          receiver: MessageUser(
            id: splashModel.user!.id,
            user_name: splashModel.user!.user_name,
            profile_image: splashModel.user!.profile_image ?? '',
          ),
          sender: MessageUser(
            id: widget.id,
            user_name: widget.user_name,
            profile_image: widget.profile_image,
          ),
          mediaUrl: data['mediaUrl'],
        ),
      );
    });

    baseModel.getAllChats(context, widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(directMessageBaseModel);
    final splashModel = ref.watch(splashScreenBaseModel);
    final chatModel = ref.watch(chatBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      bottomSheet: Container(
        color: kWhite,
        padding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(10),
          vertical: screenUtil.setHeight(10),
        ),
        width: screenUtil.screenWidth,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: TextField(
            onSubmitted: (value) {
              chatModel.emitMessage(value, splashModel.user!.id, widget.id,
                  context, null, 'TEXT');
              baseModel.enterMessage.clear();
              baseModel.addMessage(
                MessageModel(
                  id: DateTime.now().toString(),
                  senderId: splashModel.user!.id,
                  receiverId: widget.id,
                  message: value,
                  messageType: 'TEXT',
                  createdAt: DateTime.now().toString(),
                  seen: false,
                  sender: MessageUser(
                    id: splashModel.user!.id,
                    user_name: splashModel.user!.user_name,
                    profile_image: splashModel.user!.profile_image ?? '',
                  ),
                  receiver: MessageUser(
                    id: widget.id,
                    user_name: widget.user_name,
                    profile_image: widget.profile_image,
                  ),
                ),
              );
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
                        ? GestureDetector(
                            onTap: () {
                              imageSource(
                                title: "Select an Image to share",
                                context: context,
                                screenUtil: screenUtil,
                                camera: baseModel.selectCameraImage,
                                gallery: baseModel.selectGalleryImage,
                              ).then((value) {
                                if (baseModel.chatImage != null) {
                                  baseModel.uploadMedia(context).then((value) {
                                    Global.logger
                                        .e(baseModel.enterMessage.text);
                                    chatModel.emitMessage(
                                      baseModel.enterMessage.text,
                                      splashModel.user!.id,
                                      widget.id,
                                      context,
                                      value,
                                      'IMAGE',
                                    );
                                    baseModel.enterMessage.clear();
                                    baseModel.addMessage(
                                      MessageModel(
                                        mediaUrl: value,
                                        id: DateTime.now().toString(),
                                        senderId: splashModel.user!.id,
                                        receiverId: widget.id,
                                        message: baseModel.enterMessage.text,
                                        messageType: 'IMAGE',
                                        createdAt: DateTime.now().toString(),
                                        seen: false,
                                        sender: MessageUser(
                                          id: splashModel.user!.id,
                                          user_name:
                                              splashModel.user!.user_name,
                                          profile_image:
                                              splashModel.user!.profile_image ??
                                                  '',
                                        ),
                                        receiver: MessageUser(
                                          id: widget.id,
                                          user_name: widget.user_name,
                                          profile_image: widget.profile_image,
                                        ),
                                      ),
                                    );
                                  });
                                }
                              });
                            },
                            child: const Icon(
                              Icons.image_outlined,
                              size: 28,
                            ),
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
              // prefixIcon: const Icon(
              //   Icons.camera_alt_rounded,
              // ),
            ),
          ),
        ),
      ),
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
      body: baseModel.loader
          ? const Center(
              child: CircularProgressIndicator(
                color: kYellow,
              ),
            )
          : Padding(
              padding: EdgeInsets.only(
                bottom: screenUtil.setHeight(70),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) {
                        return Container();
                      },
                      reverse: true,
                      itemCount: baseModel.chatList.length,
                      itemBuilder: (context, index) {
                        bool isSender = baseModel
                                .chatList[baseModel.chatList.length - 1 - index]
                                .receiver!
                                .id ==
                            widget.id;
                        return Container(
                          padding: EdgeInsets.only(
                            left: screenUtil.setWidth(12),
                            top: screenUtil.setHeight(16),
                          ),
                          child: isSender
                              ? senderBubble(
                                  screenUtil,
                                  baseModel.chatList[
                                      baseModel.chatList.length - 1 - index],
                                )
                              : recieverBubble(
                                  screenUtil,
                                  baseModel.chatList[
                                      baseModel.chatList.length - 1 - index],
                                ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Row recieverBubble(ScreenUtil screenUtil, MessageModel message) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
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
          constraints: BoxConstraints(maxWidth: screenUtil.setWidth(250)),
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
            child: message.messageType == 'TEXT'
                ? TextUtil.secondaryText(
                    text: message.message,
                    color: kTextTitle,
                    size: 10,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      NetImage(
                        height: screenUtil.setHeight(200),
                        uri: message.mediaUrl,
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(10),
                      ),
                      TextUtil.secondaryText(
                        text: message.message,
                        color: kTextTitle,
                        size: 10,
                      )
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}
