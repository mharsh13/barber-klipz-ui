import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final addPostBaseModel = ChangeNotifierProvider((ref) => AddPostBaseModel(ref));

class AddPostBaseModel extends ChangeNotifier {
  final Ref ref;
  AddPostBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  TextEditingController _caption = TextEditingController();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  TextEditingController get caption => _caption;
}
