import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/button_util.dart';
import '../../../Utils/net_image.dart';
import '../../../Utils/text_util.dart';

Padding subscriptions(ScreenUtil screenUtil) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: screenUtil.setHeight(20),
      horizontal: screenUtil.setWidth(10),
    ),
    child: Column(
      children: [
        const Icon(
          Icons.stars_sharp,
          size: 105,
        ),
        SizedBox(
          height: screenUtil.setHeight(10),
        ),
        TextUtil.secondaryText(
          text: 'Barber Klipz Subscriptions',
          color: kBlack,
          size: 17,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: screenUtil.setHeight(20),
        ),
        TextUtil.secondaryText(
          text:
              'Subscribe to any user monthly.\nTap on the "subscribe" button on their profile to gain access to all their posts, stories, audio/video rooms.',
          color: kTextSubTitle,
          size: 11,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screenUtil.setHeight(20),
        ),
        TextUtil.secondaryText(
          text: 'Discover Users!',
          color: kBlack,
          size: 15,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: screenUtil.setHeight(10),
        ),
        ListView.builder(
          itemCount: 12,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenUtil.setWidth(10),
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          width: screenUtil.setHeight(40),
                          height: screenUtil.setHeight(40),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextUtil.secondaryText(
                              text: "George",
                              color: kBlack,
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: screenUtil.setHeight(2),
                            ),
                            TextUtil.secondaryText(
                              text: "Public Figure",
                              color: kTextSubTitle,
                              size: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const Spacer(),
                        ButtonUtil.microButtonUtil(
                          text: "Follow",
                          screenUtil: screenUtil,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenUtil.setHeight(15),
                )
              ],
            );
          },
        )
      ],
    ),
  );
}
