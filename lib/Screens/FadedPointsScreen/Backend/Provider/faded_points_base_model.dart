import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final fadedPointsBaseModel =
    ChangeNotifierProvider((ref) => FadedPointsBaseModel(ref));

class FadedPointsBaseModel extends ChangeNotifier {
  final Ref ref;
  FadedPointsBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  int _currentValue = 0;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  int get currentValue => _currentValue;

  //functions

  //changes the value of the tab bar
  void setValue(value) {
    _currentValue = value;
    notifyListeners();
  }
}
