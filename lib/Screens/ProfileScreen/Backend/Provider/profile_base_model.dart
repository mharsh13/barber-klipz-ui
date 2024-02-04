// ignore_for_file: use_build_context_synchronously

import 'package:barber_klipz_ui/Screens/ProfileScreen/Backend/Models/user_post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Utils/toast_util.dart';

final profileBaseModel = ChangeNotifierProvider((ref) => ProfileBaseModel(ref));

class ProfileBaseModel extends ChangeNotifier {
  final Ref ref;
  ProfileBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  int _currentValue = 0;
  bool _loader = false;
  final ApiHelper _apiHelper = ApiHelper();
  final List<UserPostModel> _allPosts = [];

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  int get currentValue => _currentValue;
  bool get loader => _loader;
  ApiHelper get apiHelper => _apiHelper;
  List<UserPostModel> get allPosts => _allPosts;

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

  //gets the list of all the user posts
  Future<void> getAllUserPosts(BuildContext context) async {
    try {
      _loader = true;
      await _apiHelper
          .getData(context: context, url: "user/get-all-post")
          .then((value) {
        _loader = false;
        _allPosts.clear();
        if (value != null) {
          List data = value["data"];
          for (Map<String, dynamic> post in data) {
            _allPosts.add(UserPostModel.fromMap(post));
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
