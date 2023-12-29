import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/text_util.dart';

Column paymentProfile(ScreenUtil screenUtil) {
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
          text: "Payment Profile",
          color: kBlack1,
          size: 17,
          fontWeight: FontWeight.w500,
        ),
      ),
      SizedBox(
        height: screenUtil.setHeight(25),
      ),
      DottedBorder(
        padding: EdgeInsets.symmetric(vertical: screenUtil.setHeight(15)),
        borderPadding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(12),
        ),
        borderType: BorderType.RRect,
        radius: const Radius.circular(20),
        dashPattern: const [13, 13],
        color: kTextSubTitle,
        strokeWidth: 3,
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.credit_card_rounded,
                color: kTextSubTitle,
                size: 80,
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(10),
            ),
            Center(
              child: TextUtil.secondaryText(
                text: "Revenue profile available shortly!",
                color: kBlack1,
                size: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(5),
            ),
            Center(
              child: TextUtil.secondaryText(
                text:
                    "You'll be able to create your Stripe profile\n to start receiving payments soon.",
                color: kTextSubTitle,
                size: 12,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: screenUtil.setHeight(18),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: screenUtil.setWidth(18)),
        child: TextUtil.secondaryText(
          text: "How do I get paid?",
          color: kError,
          size: 12,
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
