import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';

final followerListBaseModel =
    ChangeNotifierProvider((ref) => FollowerListBaseModel(ref));

class FollowerListBaseModel extends ChangeNotifier {
  final Ref ref;
  FollowerListBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final ApiHelper _apiHelper = ApiHelper();
  bool _loader = false;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  bool get loader => _loader;
  ApiHelper get apiHelper => _apiHelper;
}
