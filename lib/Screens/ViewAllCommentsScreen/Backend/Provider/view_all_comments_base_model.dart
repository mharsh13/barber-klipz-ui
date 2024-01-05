import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final viewAllCommentsBaseModel =
    ChangeNotifierProvider((ref) => ViewAllComentsBaseModel(ref));

class ViewAllComentsBaseModel extends ChangeNotifier {
  final Ref ref;
  ViewAllComentsBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextEditingController _enterComment = TextEditingController();
  final bool _isFavourite = true;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  TextEditingController get enterComment => _enterComment;
  bool get isFavourtie => _isFavourite;
}
