import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final exploreScreenBaseModel =
    ChangeNotifierProvider((ref) => ExploreScreenBaseModel(ref));

class ExploreScreenBaseModel extends ChangeNotifier {
  final Ref ref;
  ExploreScreenBaseModel(this.ref);

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
