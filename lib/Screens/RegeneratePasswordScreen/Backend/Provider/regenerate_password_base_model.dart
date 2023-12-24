import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final regeneratePasswordBaseModel =
    ChangeNotifierProvider((ref) => RegeneratePasswordBaseModel(ref));

class RegeneratePasswordBaseModel extends ChangeNotifier {
  final Ref ref;
  RegeneratePasswordBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
}
