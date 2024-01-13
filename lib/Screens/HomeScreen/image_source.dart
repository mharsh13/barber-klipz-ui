import 'package:barber_klipz_ui/Screens/HomeScreen/camera_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/text_util.dart';
import '../../Utils/navigator_util.dart';

Future<void> imageSource({
  required BuildContext context,
  required ScreenUtil screenUtil,
  required String title,
  required Future<void> Function() gallery,
}) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: kYellow,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 12,
    builder: (BuildContext context) {
      return SizedBox(
        height: screenUtil.setHeight(145),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenUtil.setHeight(18),
            ),
            Row(
              children: [
                SizedBox(
                  width: screenUtil.setWidth(23),
                ),
                TextUtil.secondaryText(
                  text: title,
                  color: kTextBody,
                  size: 14,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(
              height: screenUtil.setHeight(18),
            ),
            Row(
              children: [
                SizedBox(
                  width: screenUtil.setWidth(25),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kBlack,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          NavigatorUtil.push(
                            context,
                            screen: const CameraPage(),
                          ).then((value) => Navigator.of(context).pop());
                        },
                        icon: const Icon(Icons.camera_alt_rounded),
                        color: kBlack,
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(4),
                    ),
                    TextUtil.secondaryText(
                      text: "Camera",
                      color: kTextBody,
                      fontWeight: FontWeight.w500,
                      size: 10,
                    ),
                  ],
                ),
                SizedBox(
                  width: screenUtil.setWidth(18),
                ),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kBlack,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          gallery()
                              .then((value) => Navigator.of(context).pop());
                        },
                        icon: const Icon(Icons.image),
                        color: kBlack,
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(4),
                    ),
                    TextUtil.secondaryText(
                      text: "Gallery",
                      color: kTextBody,
                      fontWeight: FontWeight.w500,
                      size: 10,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    },
  );
}
