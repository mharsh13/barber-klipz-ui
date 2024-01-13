import 'package:barber_klipz_ui/Utils/net_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/text_util.dart';

GridView postsComponent(ScreenUtil screenUtil) {
  // return
  //  Padding(
  //   padding: EdgeInsets.symmetric(vertical: screenUtil.setHeight(20)),
  //   child: Column(children: [
  //     Icon(
  //       Icons.video_collection_outlined,
  //       color: kHintText,
  //       size: screenUtil.setSp(80),
  //     ),
  //     SizedBox(
  //       height: screenUtil.setHeight(10),
  //     ),
  //     TextUtil.secondaryText(
  //       text: "Your content has values!",
  //       color: kBlack,
  //       size: 18,
  //       fontWeight: FontWeight.w500,
  //     ),
  //     SizedBox(
  //       height: screenUtil.setHeight(10),
  //     ),
  //     TextUtil.secondaryText(
  //       text: "Create your first piece of content\nand start making money.",
  //       color: kBlack,
  //       size: 14,
  //       fontWeight: FontWeight.w400,
  //       textAlign: TextAlign.center,
  //     )
  //   ]),
  // );
  return GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: 5,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      childAspectRatio: 1,
      crossAxisCount: 3,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      // mainAxisExtent: screenUtil.setHeight(136),
    ),
    itemBuilder: (context, index) {
      return const NetImage(
        uri:
            "https://images.unsplash.com/photo-1621155346337-1d19476ba7d6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGltYWdlfGVufDB8fDB8fHww",
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
