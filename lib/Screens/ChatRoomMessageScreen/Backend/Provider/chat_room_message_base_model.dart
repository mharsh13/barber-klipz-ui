import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chatRoomMessageBaseModel =
    ChangeNotifierProvider((ref) => ChatRoomMessageBaseModel(ref));

class ChatRoomMessageBaseModel extends ChangeNotifier {
  final Ref ref;
  ChatRoomMessageBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextEditingController _enterMessage = TextEditingController();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  TextEditingController get enterMessage => _enterMessage;
}
