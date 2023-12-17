import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final newMessageBaseModel =
    ChangeNotifierProvider((ref) => NewMessageBaseModel(ref));

class NewMessageBaseModel extends ChangeNotifier {
  final Ref ref;
  NewMessageBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  bool _isChecked = false;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  bool get isChecked => _isChecked;

  //functions

  void checkUser(value) {
    _isChecked = value;
    notifyListeners();
  }
}
