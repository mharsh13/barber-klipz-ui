import 'package:flutter/material.dart';

class NavigatorUtil {
  static push(BuildContext context, {required Widget screen}) {
    return Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => screen,
    ));
  }

  static pushReplacement(BuildContext context, {required Widget screen}) {
    return Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static pushAndRemoveUntil(BuildContext context, {required Widget screen}) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => screen,
        ),
        (Route<dynamic> route) => false);
  }
}
