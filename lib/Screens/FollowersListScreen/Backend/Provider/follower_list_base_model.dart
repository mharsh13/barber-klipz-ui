import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Utils/toast_util.dart';
import '../../../FollowingListScreen/Backend/Model/following_model.dart';

final followerListBaseModel =
    ChangeNotifierProvider((ref) => FollowerListBaseModel(ref));

class FollowerListBaseModel extends ChangeNotifier {
  final Ref ref;
  FollowerListBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final ApiHelper _apiHelper = ApiHelper();
  bool _loader = false;
  final List<FollowingModel> _followerList = [];

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  bool get loader => _loader;
  ApiHelper get apiHelper => _apiHelper;
  List<FollowingModel> get followerList => _followerList;

  //api functions

  Future<void> getAllFollowerList(BuildContext context, String userId) async {
    try {
      _loader = true;
      await _apiHelper
          .getData(context: context, url: "user/get/followers/$userId")
          .then((value) {
        _loader = false;
        _followerList.clear();
        if (value != null) {
          print(value);
          List data = value["data"];
          for (Map<String, dynamic> user in data) {
            _followerList.add(FollowingModel.fromMap(user));
          }
        }
      });
      notifyListeners();
    } catch (e) {
      print(e);
      _loader = false;
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }
}
