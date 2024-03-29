import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Utils/toast_util.dart';

final newMessageBaseModel =
    ChangeNotifierProvider((ref) => NewMessageBaseModel(ref));

class NewMessageBaseModel extends ChangeNotifier {
  final Ref ref;
  NewMessageBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  bool _isChecked = false;
  final ApiHelper _apiHelper = ApiHelper();
  bool _loader = false;
  final List<UserModel> _users = [];

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  bool get isChecked => _isChecked;
  List<UserModel> get users => _users;
  bool get loader => _loader;

  //functions

  void checkUser(value) {
    _isChecked = value;
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
