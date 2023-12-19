import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final inboxBaseModel = ChangeNotifierProvider((ref) => InboxBaseModel(ref));

class InboxBaseModel extends ChangeNotifier {
  final Ref ref;
  InboxBaseModel(this.ref);

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
