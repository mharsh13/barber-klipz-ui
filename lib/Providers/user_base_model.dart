import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Helpers/api_helpers.dart';
import '../Utils/toast_util.dart';

final userBaseModel = ChangeNotifierProvider((ref) => UserBaseModel(ref));

class UserBaseModel extends ChangeNotifier {
  final Ref ref;
  UserBaseModel(this.ref);

  final ApiHelper _apiHelper = ApiHelper();
  UserModel? _user;

  ApiHelper get apiHelper => _apiHelper;
  UserModel? get user => _user;

  Future<void> getUserDetails(BuildContext context) async {
    try {
      await _apiHelper.getData(context: context, url: "auth/me").then((value) {
        if (value != null) {
          print('------------------------------');
          print(value);
          print('------------------------------');
          _user = UserModel.fromMap(value["data"]);
        }
      });
    } catch (e) {
      print('------------------------------');
      print(e);
      print('------------------------------');
      ToastUtil(context).showErrorToastNotification('Something went wrong');
    }
  }
}
