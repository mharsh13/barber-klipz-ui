import 'package:barber_klipz_ui/Models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Utils/toast_util.dart';

final directMessageBaseModel =
    ChangeNotifierProvider((ref) => DirectMessageBaseModel(ref));

class DirectMessageBaseModel extends ChangeNotifier {
  final Ref ref;
  DirectMessageBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _enterMessage = TextEditingController();
  final ApiHelper _apiHelper = ApiHelper();
  bool _loader = false;
  final List<MessageModel> _chatList = [];

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  ScrollController get scrollController => _scrollController;
  TextEditingController get enterMessage => _enterMessage;
  bool get loader => _loader;
  List<MessageModel> get chatList => _chatList;

  Future<void> getAllChats(BuildContext context, String id) async {
    try {
      _loader = true;
      await _apiHelper
          .getData(context: context, url: "chat/get-messages/$id")
          .then((value) {
        _loader = false;
        _chatList.clear();
        if (value != null) {
          List data = value["data"];
          for (Map<String, dynamic> chat in data) {
            _chatList.add(MessageModel.fromMap(chat));
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

  void addMessage(MessageModel message) {
    _chatList.add(message);
    notifyListeners();
  }
}
