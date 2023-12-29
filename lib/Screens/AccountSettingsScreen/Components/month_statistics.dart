import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/text_util.dart';

Column monthStatistics(ScreenUtil screenUtil) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: screenUtil.setHeight(15),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(18),
        ),
        child: TextUtil.secondaryText(
          text: "Month Statistics",
          color: kBlack1,
          size: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(
        height: screenUtil.setHeight(25),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(18),
        ),
        child: TextUtil.secondaryText(
          text:
              "The statistics correspond to the interaction of\nBarber Klipz users with your account during the last month.",
          color: kTextSubTitle,
          size: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(
        height: screenUtil.setHeight(15),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: screenUtil.setWidth(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                TextUtil.secondaryText(
                  text: "0",
                  color: kBlack,
                  size: 15,
                  fontWeight: FontWeight.bold,
                ),
                TextUtil.secondaryText(
                  text: "Faded points",
                  color: kTextSubTitle,
                  size: 12,
                  fontWeight: FontWeight.w500,
                )
              ],
            ),
            Column(
              children: [
                TextUtil.secondaryText(
                  text: "0",
                  color: kBlack,
                  size: 15,
                  fontWeight: FontWeight.bold,
                ),
                TextUtil.secondaryText(
                  text: "Subscribers",
                  color: kTextSubTitle,
                  size: 12,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Column(
              children: [
                TextUtil.secondaryText(
                  text: "0",
                  color: kBlack,
                  size: 15,
                  fontWeight: FontWeight.bold,
                ),
                TextUtil.secondaryText(
                  text: "Likes",
                  color: kTextSubTitle,
                  size: 12,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            Column(
              children: [
                TextUtil.secondaryText(
                  text: "0",
                  color: kBlack,
                  size: 15,
                  fontWeight: FontWeight.bold,
                ),
                TextUtil.secondaryText(
                  text: "Followers",
                  color: kTextSubTitle,
                  size: 12,
                  fontWeight: FontWeight.w500,
                ),
              ],
            )
          ],
        ),
      ),
      SizedBox(
        height: screenUtil.setHeight(15),
      ),
      const Divider(
        color: kGrey,
      )
    ],
  );
}
