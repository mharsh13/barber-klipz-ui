// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Utils/toast_util.dart';
import '../../../SplashScreen/Backend/Models/user_model.dart';

final exploreScreenBaseModel =
    ChangeNotifierProvider((ref) => ExploreScreenBaseModel(ref));

class ExploreScreenBaseModel extends ChangeNotifier {
  final Ref ref;
  ExploreScreenBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  int _currentValue = 0;
  final ApiHelper _apiHelper = ApiHelper();
  bool _loader = false;
  final List<UserModel> _users = [];

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  int get currentValue => _currentValue;
  List<UserModel> get users => _users;
  bool get loader => _loader;
  //functions

  //changes the value of the tab bar
  void setValue(value) {
    _currentValue = value;
    notifyListeners();
  }

  Future<void> getAllUsers(BuildContext context) async {
    try {
      _loader = true;
      await _apiHelper
          .getData(context: context, url: "user/get-all")
          .then((value) {
        _loader = false;
        _users.clear();
        if (value != null) {
          List data = value["data"];
          for (Map<String, dynamic> user in data) {
            _users.add(UserModel.fromMap(user));
          }
        }
      });
      notifyListeners();
    } catch (e) {
      _loader = false;
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }
}
