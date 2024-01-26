import 'package:barber_klipz_ui/Screens/ChatRoomMessageScreen/Backend/Provider/chat_room_message_base_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/net_image.dart';
import '../../Utils/text_util.dart';

class ChatRoomMessageScreen extends ConsumerWidget {
  const ChatRoomMessageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseModel = ref.watch(chatRoomMessageBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: kBlack2,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: kYellow),
              ),
              width: screenUtil.setHeight(40),
              height: screenUtil.setHeight(40),
              child: const Icon(
                Icons.chat_bubble_outline_rounded,
                color: kWhite,
              ),
            ),
            SizedBox(
              width: screenUtil.setWidth(12),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtil.secondaryText(
                  text: "What do you have to offer?",
                  color: kGold,
                  size: 13,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: screenUtil.setHeight(5),
                ),
                TextUtil.secondaryText(
                  text: "Hosted by: George",
                  color: kGold,
                  size: 11,
                  fontWeight: FontWeight.bold,
                ),
              ],
            )
          ],
        ),
        centerTitle: false,
        leading: const BackButton(
          color: kWhite,
        ),
        leadingWidth: screenUtil.setWidth(30),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(10),
          vertical: screenUtil.setHeight(10),
        ),
        width: screenUtil.screenWidth,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: TextFormField(
            maxLines: 3,
            minLines: 1,
            controller: baseModel.enterMessage,
            cursorColor: kBlack,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                top: 13,
                bottom: 13,
                left: 10,
              ),
              hintText: "Type a message",
              hintStyle: const TextStyle(
                fontSize: 16,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(
                  right: screenUtil.setWidth(8),
                  top: screenUtil.setHeight(10),
                ),
                child: TextUtil.secondaryText(
                  text: "Send",
                  color: kBlack,
                  size: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: screenUtil.setHeight(5)),
              padding: EdgeInsets.only(
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
                      child: const NetImage(
                        uri:
                            "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: screenUtil.setWidth(8),
                  ),
                  Container(
                    width: screenUtil.setWidth(290),
                    margin: EdgeInsets.only(
                      right: screenUtil.setWidth(12),
                    ),
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
                        horizontal: screenUtil.setWidth(12),
                        vertical: screenUtil.setHeight(7),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TextUtil.secondaryText(
                                text: "George",
                                color: kBlack,
                                size: 10,
                                fontWeight: FontWeight.w600,
                              ),
                              SizedBox(
                                width: screenUtil.setWidth(5),
                              ),
                              TextUtil.secondaryText(
                                text: "Helloooooooo",
                                color: kTextTitle,
                                size: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: screenUtil.setHeight(5),
                          ),
                          TextUtil.secondaryText(
                            text: "1m",
                            color: kBlack,
                            size: 7,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
