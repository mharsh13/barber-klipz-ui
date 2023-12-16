import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final directMessageBaseModel =
    ChangeNotifierProvider((ref) => DirectMessageBaseModel(ref));

class DirectMessageBaseModel extends ChangeNotifier {
  final Ref ref;
  DirectMessageBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _enterMessage = TextEditingController();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  ScrollController get scrollController => _scrollController;
  TextEditingController get enterMessage => _enterMessage;
}
