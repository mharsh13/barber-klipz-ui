// ignore_for_file: use_build_context_synchronously

import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Utils/toast_util.dart';
import '../../../ProfileScreen/Backend/Models/user_post_model.dart';

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
  UserModel? _userData;
  final List<UserPostModel> _allPosts = [];

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  int get currentValue => _currentValue;
  bool get loader => _loader;
  ApiHelper get apiHelper => _apiHelper;
  List<UserPostModel> get allPosts => _allPosts;
  UserModel? get userData => _userData;

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
  Future<void> getAllUserPosts(BuildContext context, String userId) async {
    try {
      _loader = true;
      await _apiHelper
          .getData(context: context, url: "post/get-all/$userId")
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

  //gets user data
  Future<void> getUserDetail(BuildContext context, String userId) async {
    try {
      _loader = true;
      await _apiHelper
          .getData(context: context, url: "user/get/$userId")
          .then((value) {
        _loader = false;
        if (value != null) {
          _userData = UserModel.fromMap(value['data']);
        }
      });
      notifyListeners();
    } catch (e) {
      _loader = false;
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }

  //gets user data
  Future<void> toggleFollow(BuildContext context, String userId) async {
    try {
      _loader = true;
      await _apiHelper.postData(
          context: context,
          url: "user/toggle-follow/$userId",
          data: {}).then((value) {
        _loader = false;
        if (value != null) {
          if (value['message'] == 'User unfollowed successfully') {
            _userData!.isFollowing = false;
          } else {
            _userData!.isFollowing = true;
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
