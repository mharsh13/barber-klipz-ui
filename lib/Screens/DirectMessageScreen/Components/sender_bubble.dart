import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Models/message_model.dart';
import '../../../Resources/color_const.dart';
import '../../../Utils/net_image.dart';
import '../../../Utils/text_util.dart';

Widget senderBubble(ScreenUtil screenUtil, MessageModel message) {
  return Container(
    padding: EdgeInsets.only(
      right: screenUtil.setWidth(15),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: screenUtil.setWidth(250)),
          decoration: BoxDecoration(
            color: kBackgroundGrey,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(screenUtil.setSp(13)),
              bottomLeft: Radius.circular(screenUtil.setSp(13)),
              topLeft: Radius.circular(screenUtil.setSp(13)),
              bottomRight: Radius.circular(screenUtil.setSp(0)),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenUtil.setWidth(15),
              vertical: screenUtil.setHeight(10),
            ),
            child: TextUtil.secondaryText(
              text: message.message,
              color: kTextTitle,
              size: 10,
            ),
          ),
        ),
        SizedBox(
          width: screenUtil.setWidth(8),
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
          width: screenUtil.setHeight(30),
          height: screenUtil.setHeight(30),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: NetImage(
              uri: message.sender?.profile_image ?? '',
            ),
          ),
        ),
      ],
    ),
  );
}
