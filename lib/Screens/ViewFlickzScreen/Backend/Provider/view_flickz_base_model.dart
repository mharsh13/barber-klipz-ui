// ignore_for_file: use_build_context_synchronously

import 'package:barber_klipz_ui/Screens/HomeScreen/Backend/Model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Utils/toast_util.dart';

final viewFlickzBaseModel =
    ChangeNotifierProvider.autoDispose((ref) => ViewFlickzBaseModel(ref));

class ViewFlickzBaseModel extends ChangeNotifier {
  final Ref ref;
  ViewFlickzBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final bool _isFavourite = true;
  final TextEditingController _enterComment = TextEditingController();
  bool _loader = false;
  final ApiHelper _apiHelper = ApiHelper();
  final List<PostModel> _allPosts = [];

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  bool get isFavourite => _isFavourite;
  TextEditingController get enterComment => _enterComment;
  bool get loader => _loader;
  ApiHelper get apiHelper => _apiHelper;
  List<PostModel> get allPosts => _allPosts;

  //API calls

  //gets the list of all the user posts
  Future<void> getAllUserFlickz(BuildContext context) async {
    try {
      _loader = true;
      await _apiHelper
          .getData(context: context, url: "post/flicks/get-all")
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
}
