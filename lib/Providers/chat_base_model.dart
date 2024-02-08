import 'package:barber_klipz_ui/Utils/toast_util.dart';
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

  static final Socket socket = io(Global.baseURL, <String, dynamic>{
    'autoConnect': false,
    'transports': ['websocket'],
  });

  void connectSocket() {
    socket.connect();
    socket.onConnect((_) {
      print('------------------------------------------');
      print('Connection established');
      print('------------------------------------------');
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));
  }

  void emitMessage(String message, String senderId, String receiverId,
      BuildContext context) {
    Map payload = {
      'message': message,
      'senderId': senderId,
      'receiverId': receiverId,
      'messageType': 'TEXT'
    };
    try {
      socket.emit('message', payload);
    } catch (e) {
      ToastUtil(context).showErrorToastNotification('Error');
    }
  }
}
