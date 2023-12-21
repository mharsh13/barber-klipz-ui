import 'package:barber_klipz_ui/Screens/ChangePasswordScreen/change_password_screen.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/text_util.dart';

Column accountSection(BuildContext context, ScreenUtil screenUtil) {
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
          text: "Account",
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
              text: "Change Password",
              color: kTextSubTitle,
              size: 13,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                NavigatorUtil.push(context, screen: ChangePasswordScreen());
              },
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
              text: "Change Username",
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
              text: "Verify Account",
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
              text: "Import content from Instagram",
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
              text: "Import content from tik tok",
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
              text: "Notification Settings",
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
