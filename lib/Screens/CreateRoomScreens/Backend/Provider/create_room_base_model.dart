import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final createRoomBaseModel =
    ChangeNotifierProvider((ref) => CreateRoomBaseModel(ref));

class CreateRoomBaseModel extends ChangeNotifier {
  final Ref ref;
  CreateRoomBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextEditingController _publicTitle = TextEditingController();
  bool _inRoomChats = false;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  TextEditingController get publicTitle => _publicTitle;
  bool get inRoomChats => _inRoomChats;

  //functions

  void enableInRoomChats(bool value) {
    _inRoomChats = value;
    notifyListeners();
  }
}
