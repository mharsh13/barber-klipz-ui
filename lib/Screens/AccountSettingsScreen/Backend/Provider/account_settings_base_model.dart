import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final accountSettingsBaseModel =
    ChangeNotifierProvider((ref) => AccountSettingsBaseModel(ref));

class AccountSettingsBaseModel extends ChangeNotifier {
  final Ref ref;
  AccountSettingsBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
}
