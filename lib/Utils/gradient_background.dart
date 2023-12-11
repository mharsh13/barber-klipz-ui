import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Resources/color_const.dart';

Widget gradientBackground({Widget? child, required ScreenUtil screenUtil}) {
  return Container(
    height: screenUtil.screenHeight,
    width: screenUtil.screenWidth,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          PrimaryGradientColor.kPrimary,
          PrimaryGradientColor.kSecondary,
          PrimaryGradientColor.ktertiary,
          PrimaryGradientColor.kquaternary,
        ],
      ),
    ),
    child: child,
  );
}
