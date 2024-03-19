// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Resources/color_const.dart';
import '../../../../Utils/toast_util.dart';
import '../../../HomeScreen/Backend/Model/post_model.dart';

final profilePostBaseModel =
    ChangeNotifierProvider((ref) => ProfilePostBaseModel(ref));

class ProfilePostBaseModel extends ChangeNotifier {
  final Ref ref;
  ProfilePostBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  bool _loader = false;
  final ApiHelper _apiHelper = ApiHelper();
  final List<PostModel> _allPosts = [];
  bool _isLike = false;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  bool get loader => _loader;
  ApiHelper get apiHelper => _apiHelper;
  List<PostModel> get allPosts => _allPosts;
  bool get islike => _isLike;

  //api functions

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
            _allPosts.add(PostModel.fromMap(post));
          }
        }
      });
      notifyListeners();
    } catch (e) {
      _loader = false;
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }

  //like and unlike a particular post
  Future<void> likeAndUnlikePost(
      BuildContext context, PostModel postModel) async {
    try {
      Loader.show(
        context,
        progressIndicator: const CircularProgressIndicator(
          color: kPrimary,
        ),
      );
      await _apiHelper
          .postData(
              context: context,
              data: {},
              url: "post/toggle-like/${postModel.id}")
          .then((value) {
        Loader.hide();
        if (value != null) {
          if (value["message"] == "Post liked successfully") {
            postModel.liked = true;
            postModel.likes_count++;
            _isLike = true;
            ToastUtil(context)
                .showSuccessToastNotification("Post liked successfully");
          } else if (value["message"] == "Post disliked successfully") {
            postModel.liked = false;
            postModel.likes_count--;
            _isLike = false;
            ToastUtil(context)
                .showSuccessToastNotification("Post disliked successfully");
          }
        }
        notifyListeners();
      });
    } catch (e) {
      Loader.hide();
      notifyListeners();
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }
}
