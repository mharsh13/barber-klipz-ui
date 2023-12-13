import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationBaseModel =
    ChangeNotifierProvider((ref) => NotificationScreenBaseModel(ref));

class NotificationScreenBaseModel extends ChangeNotifier {
  final Ref ref;
  NotificationScreenBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
}
