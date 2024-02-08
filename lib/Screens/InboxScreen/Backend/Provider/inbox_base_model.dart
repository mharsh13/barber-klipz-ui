import 'package:barber_klipz_ui/Screens/InboxScreen/Backend/Model/inbox_model.dart';
import 'package:barber_klipz_ui/Utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../Helpers/api_helpers.dart';

final inboxBaseModel = ChangeNotifierProvider((ref) => InboxBaseModel(ref));

class InboxBaseModel extends ChangeNotifier {
  final Ref ref;
  InboxBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  int _currentValue = 0;
  final List<InboxModel> _inboxList = [];
  final ApiHelper _apiHelper = ApiHelper();
  bool _loader = false;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  int get currentValue => _currentValue;
  List<InboxModel> get inboxList => _inboxList;
  bool get loader => _loader;

  //functions

  //changes the value of the tab bar
  void setValue(value) {
    _currentValue = value;
    notifyListeners();
  }

  Future<void> getAllInbox(BuildContext context) async {
    try {
      _loader = true;
      await _apiHelper
          .getData(context: context, url: "chat/get-users")
          .then((value) {
        _loader = false;
        _inboxList.clear();
        if (value != null) {
          List data = value["data"];
          for (Map<String, dynamic> user in data) {
            _inboxList.add(InboxModel.fromMap(user));
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
