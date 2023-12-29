import 'package:shared_preferences/shared_preferences.dart';

import '../global.dart';

class SharedPreferenceUtil {
  static void setJwt(String jwt) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', jwt);
  }

  static Future<String> getJwt() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('jwt') != null) {
      Global.jwt = (prefs.getString('jwt'))!;
      return Global.jwt;
    } else {
      return "";
    }
  }
}
