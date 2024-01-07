import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final singleAudioVideoRoomBaseModel =
    ChangeNotifierProvider((ref) => SingleAudioVideoRoomBaseModel(ref));

class SingleAudioVideoRoomBaseModel extends ChangeNotifier {
  final Ref ref;
  SingleAudioVideoRoomBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
}
