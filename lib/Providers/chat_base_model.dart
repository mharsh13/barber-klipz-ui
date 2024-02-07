import 'package:barber_klipz_ui/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart';

final chatBaseModel = ChangeNotifierProvider((ref) => ChatBaseModel(ref));

class ChatBaseModel extends ChangeNotifier {
  final Ref ref;
  ChatBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();

  //getters
  ScreenUtil get screenUtil => _screenUtil;

  //functions

  Socket socket = io(Global.baseURL);

  void connectSocket() {
    socket.connect();
  }
}
