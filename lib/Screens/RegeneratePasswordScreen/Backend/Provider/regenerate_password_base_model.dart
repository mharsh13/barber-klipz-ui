import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final regeneratePasswordBaseModel =
    ChangeNotifierProvider((ref) => RegeneratePasswordBaseModel(ref));

class RegeneratePasswordBaseModel extends ChangeNotifier {
  final Ref ref;
  RegeneratePasswordBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get newPassword => _newPassword;
  TextEditingController get confirmPassword => _confirmPassword;
}
