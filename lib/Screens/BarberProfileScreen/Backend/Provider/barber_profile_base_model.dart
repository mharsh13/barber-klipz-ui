// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';

final barberProfileBaseModel =
    ChangeNotifierProvider((ref) => BarberProfileBaseModel(ref));

class BarberProfileBaseModel extends ChangeNotifier {
  final Ref ref;
  BarberProfileBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  int _currentValue = 0;
  bool _loader = false;
  final ApiHelper _apiHelper = ApiHelper();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  int get currentValue => _currentValue;
  bool get loader => _loader;
  ApiHelper get apiHelper => _apiHelper;

  //functions

  //changes the value of the tab bar
  void setValue(value) {
    _currentValue = value;
    notifyListeners();
  }

  void setLoader(bool loader) {
    _loader = loader;
    notifyListeners();
  }

  //API functions
}
