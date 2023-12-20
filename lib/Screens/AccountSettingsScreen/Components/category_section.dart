import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/text_util.dart';

Column category(ScreenUtil screenUtil) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(18),
        ),
        child: Row(
          children: [
            TextUtil.secondaryText(
              text: "Category",
              color: kTextSubTitle,
              size: 14,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: kTextSubTitle,
                size: 20,
              ),
            )
          ],
        ),
      ),
      const Divider(
        color: kGrey,
      )
    ],
  );
}
