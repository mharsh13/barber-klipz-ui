import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Resources/color_const.dart';
import 'text_util.dart';

class AppBarUtil {
  static PreferredSizeWidget commonAppBar(
    BuildContext context, {
    String? title,
    double? elevation,
    List<Widget>? actions,
    bool? isCenterTitle,
    Function()? onBack,
    required ScreenUtil screenUtil,
  }) {
    return AppBar(
      elevation: elevation ?? 0,
      actions: actions ?? [],
      leadingWidth: onBack == null ? 0 : screenUtil.setWidth(40),
      centerTitle: isCenterTitle ?? false,
      automaticallyImplyLeading: false,
      leading: onBack == null
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                alignment: Alignment.center,
                icon: const Icon(Icons.chevron_left),
                onPressed: onBack,
              ),
            ),
      title: title != null
          ? TextUtil.secondaryText(
              text: title,
              color: kWhite,
              size: screenUtil.setHeight(13),
              fontWeight: FontWeight.w600,
            )
          : Container(),
      flexibleSpace: Container(
        decoration: const BoxDecoration(color: kLicorice),
      ),
    );
  }
}
