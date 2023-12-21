import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final viewFlickzBaseModel =
    ChangeNotifierProvider.autoDispose((ref) => ViewFlickzBaseModel(ref));

class ViewFlickzBaseModel extends ChangeNotifier {
  final Ref ref;
  ViewFlickzBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
}
