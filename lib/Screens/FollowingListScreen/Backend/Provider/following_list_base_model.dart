// ignore_for_file: use_build_context_synchronously

import 'package:barber_klipz_ui/Screens/FollowingListScreen/Backend/Model/following_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Utils/toast_util.dart';

final followingListBaseModel =
    ChangeNotifierProvider((ref) => FollowingListBaseModel(ref));

class FollowingListBaseModel extends ChangeNotifier {
  final Ref ref;
  FollowingListBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final List<FollowingModel> _followingList = [];
  final ApiHelper _apiHelper = ApiHelper();
  bool _loader = false;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  List<FollowingModel> get followingList => _followingList;
  bool get loader => _loader;

  //api functions

  Future<void> getAllFollowingList(BuildContext context, String userId) async {
    try {
      _loader = true;
      await _apiHelper
          .getData(context: context, url: "user/get/followings/$userId")
          .then((value) {
        _loader = false;
        _followingList.clear();
        if (value != null) {
          List data = value["data"];
          for (Map<String, dynamic> user in data) {
            _followingList.add(FollowingModel.fromMap(user));
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
