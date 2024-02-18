import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final followerListBaseModel =
    ChangeNotifierProvider((ref) => FollowerListBaseModel(ref));

class FollowerListBaseModel extends ChangeNotifier {
  final Ref ref;
  FollowerListBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
}
