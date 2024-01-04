import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final audioVideoChatRoomBaseModel =
    ChangeNotifierProvider((ref) => AudioVideoChatRoomBaseModel(ref));

class AudioVideoChatRoomBaseModel extends ChangeNotifier {
  final Ref ref;
  AudioVideoChatRoomBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
}
