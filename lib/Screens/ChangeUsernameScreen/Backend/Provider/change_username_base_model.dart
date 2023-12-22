import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final changeUsernameBaseModel =
    ChangeNotifierProvider((ref) => ChangeUsernameBaseModel(ref));

class ChangeUsernameBaseModel extends ChangeNotifier {
  final Ref ref;
  ChangeUsernameBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
}
