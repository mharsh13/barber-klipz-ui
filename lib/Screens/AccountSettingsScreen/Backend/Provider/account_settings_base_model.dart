import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final accountSettingsBaseModel =
    ChangeNotifierProvider((ref) => AccountSettingsBaseModel(ref));

class AccountSettingsBaseModel extends ChangeNotifier {
  final Ref ref;
  AccountSettingsBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextEditingController _selectedDate = TextEditingController();
  final TextEditingController _newDate = TextEditingController();

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  TextEditingController get newDate => _newDate;
  TextEditingController get selectedDate => _selectedDate;

  //functions

  //sets the dob of user
  Future<void> changeDate(BuildContext context) async {
    final picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: kYellow,
            colorScheme: const ColorScheme.light(
              primary: kYellow,
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now().subtract(
        const Duration(days: 3650),
      ),
    );
    if (picked != null) {
      _newDate.text = "${picked.toLocal()}".split(' ')[0];
      notifyListeners();
    }
  }
}
