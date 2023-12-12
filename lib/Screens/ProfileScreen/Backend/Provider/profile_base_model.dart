import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileBaseModel = ChangeNotifierProvider((ref) => ProfileBaseModel(ref));

class ProfileBaseModel extends ChangeNotifier {
  final Ref ref;
  ProfileBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
}
