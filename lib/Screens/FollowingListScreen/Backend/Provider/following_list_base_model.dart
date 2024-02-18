import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final followingListBaseModel =
    ChangeNotifierProvider((ref) => FollowingListBaseModel(ref));

class FollowingListBaseModel extends ChangeNotifier {
  final Ref ref;
  FollowingListBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
}
