import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final viewFlickzBaseModel =
    ChangeNotifierProvider.autoDispose((ref) => ViewFlickzBaseModel(ref));

class ViewFlickzBaseModel extends ChangeNotifier {
  final Ref ref;
  ViewFlickzBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final bool _isFavourite = true;
  final TextEditingController _enterComment = TextEditingController();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  bool get isFavourite => _isFavourite;
  TextEditingController get enterComment => _enterComment;
}
