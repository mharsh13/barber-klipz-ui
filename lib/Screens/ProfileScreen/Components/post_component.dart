import 'package:barber_klipz_ui/Screens/ProfileScreen/Backend/Provider/profile_base_model.dart';
import 'package:barber_klipz_ui/Utils/net_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/text_util.dart';

Widget postsComponent(ScreenUtil screenUtil, ProfileBaseModel baseModel) {
  return baseModel.allPosts.isEmpty
      ? Padding(
          padding: EdgeInsets.symmetric(vertical: screenUtil.setHeight(20)),
          child: Column(children: [
            Icon(
              Icons.video_collection_outlined,
              color: kHintText,
              size: screenUtil.setSp(80),
            ),
            SizedBox(
              height: screenUtil.setHeight(10),
            ),
            TextUtil.secondaryText(
              text: "Your content has values!",
              color: kBlack,
              size: 18,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: screenUtil.setHeight(10),
            ),
            TextUtil.secondaryText(
              text:
                  "Create your first piece of content\nand start making money.",
              color: kBlack,
              size: 14,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
            )
          ]),
        )
      : GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: baseModel.allPosts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1,
            crossAxisCount: 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            // mainAxisExtent: screenUtil.setHeight(136),
          ),
          itemBuilder: (context, index) {
            return NetImage(
              uri: baseModel.allPosts[index].media_url,
              fit: BoxFit.cover,
            );
            // NetImage(
            //   uri: mediaList[index].mediaType == "IMAGE"
            //       ? mediaList[index].mediaUrl
            //       : mediaList[index].thumbnailUrl,
            //   fit: BoxFit.cover,
            // );
          },
        );
}
