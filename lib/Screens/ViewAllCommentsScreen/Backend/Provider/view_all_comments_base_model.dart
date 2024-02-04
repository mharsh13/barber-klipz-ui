import 'package:barber_klipz_ui/Screens/ViewAllCommentsScreen/Backend/Model/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Utils/toast_util.dart';

final viewAllCommentsBaseModel =
    ChangeNotifierProvider((ref) => ViewAllComentsBaseModel(ref));

class ViewAllComentsBaseModel extends ChangeNotifier {
  final Ref ref;
  ViewAllComentsBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextEditingController _enterComment = TextEditingController();
  final bool _isFavourite = true;
  final ApiHelper _apiHelper = ApiHelper();
  bool _loader = false;
  final List<CommentModel> _allComments = [];

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  TextEditingController get enterComment => _enterComment;
  bool get isFavourtie => _isFavourite;
  ApiHelper get apiHelper => _apiHelper;
  bool get loader => _loader;
  List<CommentModel> get allComments => _allComments;

  //api functions

  //creates a comment
  Future<void> createComment(
    BuildContext context,
    String postId,
  ) async {
    try {
      _loader = true;
      notifyListeners();
      Map<String, dynamic> formData = {
        "postId": postId,
        "text": _enterComment.text,
      };
      await _apiHelper
          .postData(context: context, data: formData, url: "comment/create")
          .then((value) async {
        Loader.hide();
        if (value != null) {
          // _allComments.add(CommentModel.fromMap(value["data"]));
          await getAllComments(context, postId);
          _enterComment.clear();
        }
        _loader = false;
      });
      notifyListeners();
    } catch (e) {
      print(e);
      _loader = false;
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }

  //gets the list of all the comments of a post
  Future<void> getAllComments(BuildContext context, String commentId) async {
    try {
      _loader = true;
      notifyListeners();
      await _apiHelper
          .getData(context: context, url: "comment/get-all/$commentId")
          .then((value) {
        _loader = false;
        _allComments.clear();
        if (value != null) {
          List data = value["data"];
          for (Map<String, dynamic> comment in data) {
            _allComments.add(CommentModel.fromMap(comment));
          }
        }
      });
      notifyListeners();
    } catch (e) {
      _loader = false;
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }

  Future<void> likeAndUnlikeComment(
      BuildContext context, CommentModel commentModel) async {
    try {
      await _apiHelper
          .postData(
              context: context,
              data: {},
              url: "comment/toggle-like/${commentModel.id}")
          .then((value) {
        if (value != null) {
          if (value["message"] == "Comment liked successfully") {
            commentModel.liked = true;
            commentModel.likes_count++;

            ToastUtil(context)
                .showSuccessToastNotification("Comment liked successfully");
          } else if (value["message"] == "Comment disliked successfully") {
            commentModel.liked = false;
            commentModel.likes_count--;
            ToastUtil(context)
                .showSuccessToastNotification("Comment disliked successfully");
          }
        }
        notifyListeners();
      });
    } catch (e) {
      notifyListeners();
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }
}
