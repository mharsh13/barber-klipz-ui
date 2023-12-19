import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final onboardingBaseModel =
    ChangeNotifierProvider((ref) => OnboardingBaseModel(ref));

class OnboardingBaseModel extends ChangeNotifier {
  final Ref ref;
  OnboardingBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
}
