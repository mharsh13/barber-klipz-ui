import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Resources/color_const.dart';

Widget gradientBackground({Widget? child, required ScreenUtil screenUtil}) {
  return Container(
    height: screenUtil.screenHeight,
    width: screenUtil.screenWidth,
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [kBlack1, kBlack2, kLicorice, kLicorice1],
      ),
    ),
    child: child,
  );
}
