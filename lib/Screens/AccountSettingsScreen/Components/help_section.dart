import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/text_util.dart';

Column helpSection(ScreenUtil screenUtil) {
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
          text: "Help",
          color: kBlack1,
          size: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(
        height: screenUtil.setHeight(10),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(18),
        ),
        child: Row(
          children: [
            TextUtil.secondaryText(
              text: "Frequently Asked Questions (FAQs)",
              color: kTextSubTitle,
              size: 13,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: kTextSubTitle,
                size: 17,
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(18),
        ),
        child: Row(
          children: [
            TextUtil.secondaryText(
              text: "Privacy Policy",
              color: kTextSubTitle,
              size: 13,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: kTextSubTitle,
                size: 17,
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(18),
        ),
        child: Row(
          children: [
            TextUtil.secondaryText(
              text: "Support",
              color: kTextSubTitle,
              size: 13,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: kTextSubTitle,
                size: 17,
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: screenUtil.setHeight(10),
      ),
      const Divider(
        color: kGrey,
      )
    ],
  );
}
