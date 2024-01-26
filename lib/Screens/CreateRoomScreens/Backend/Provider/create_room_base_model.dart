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
  final TextEditingController _exclusiveTitle = TextEditingController();
  final TextEditingController _privateTitle = TextEditingController();
  final TextEditingController _publicTags = TextEditingController();
  final TextEditingController _exclusiveTags = TextEditingController();
  final TextEditingController _privateTags = TextEditingController();
  bool _publicInRoomChats = false;
  bool _exclusiveInRoomChats = false;
  bool _privateInRoomChats = false;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  TextEditingController get publicTitle => _publicTitle;
  TextEditingController get exclusiveTitle => _exclusiveTitle;
  TextEditingController get privateTitle => _privateTitle;
  TextEditingController get publicTags => _publicTags;
  TextEditingController get privateTags => _privateTags;
  TextEditingController get exclusiveTags => _exclusiveTags;
  bool get publicInRoomChats => _publicInRoomChats;
  bool get exclusiveInRoomChats => _exclusiveInRoomChats;
  bool get privateInRoomChats => _privateInRoomChats;

  //functions

  void enablePublicInRoomChats(bool value) {
    _publicInRoomChats = value;
    notifyListeners();
  }

  void enableExclusiveInRoomChats(bool value) {
    _exclusiveInRoomChats = value;
    notifyListeners();
  }

  void enablePrivateInRoomChats(bool value) {
    _privateInRoomChats = value;
    notifyListeners();
  }
}
