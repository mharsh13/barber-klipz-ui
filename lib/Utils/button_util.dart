import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Resources/color_const.dart';
import 'text_util.dart';

class ButtonUtil {
  static Widget primaryButton({
    required String text,
    required void Function() onPressed,
    required ScreenUtil screenUtil,
    Color? color,
    double? size,
    FontWeight? fontweight,
    bool inactive = false,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: screenUtil.setWidth(300),
        height: screenUtil.setHeight(37),
        decoration: BoxDecoration(
          color: inactive ? kButtonInactive : kYellow,
          borderRadius: BorderRadius.circular(150),
        ),
        child: Center(
          child: TextUtil.secondaryText(
            text: text,
            color: inactive ? kTextSubTitle : color ?? kWhite,
            size: size ?? 15,
            fontWeight: fontweight ?? FontWeight.w500,
          ),
        ),
      ),
    );
  }

  static Widget smallButtonUtil({
    required String text,
    required ScreenUtil screenUtil,
    required void Function() onPressed,
    BoxDecoration? decoration,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: screenUtil.setWidth(151),
        height: screenUtil.setHeight(40),
        decoration: decoration ??
            BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  offset: Offset(2, 4),
                  blurRadius: 12.0,
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                ),
              ],
              color: kYellow,
              borderRadius: BorderRadius.circular(screenUtil.setSp(100)),
            ),
        child: Center(
          child: TextUtil.primaryText(
            text: text,
            color: kWhite,
            size: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  static Widget microButtonUtil({
    required String text,
    required ScreenUtil screenUtil,
    required void Function() onPressed,
    BoxDecoration? decoration,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: screenUtil.setWidth(55),
        height: screenUtil.setHeight(22),
        decoration: decoration ??
            BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  offset: Offset(2, 4),
                  blurRadius: 12.0,
                  color: Color.fromRGBO(0, 0, 0, 0.16),
                ),
              ],
              color: kYellow,
              borderRadius: BorderRadius.circular(
                screenUtil.setSp(100),
              ),
            ),
        child: Center(
          child: TextUtil.secondaryText(
            text: text,
            color: kWhite,
            size: 9,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
