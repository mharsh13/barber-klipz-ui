import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import '../Resources/color_const.dart';

class ToastUtil {
  final BuildContext context;

  ToastUtil(this.context);

  showSuccessToastNotification(String txt, {ToastGravity? position}) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check,
            color: Colors.green,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Text(txt),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: position ?? ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  showErrorToastNotification(String txt, {ToastGravity? position}) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.close,
            color: Colors.red,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 200),
            child: Text(txt),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: position ?? ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  showDeleteNotification(String txt, {ToastGravity? position}) {
    FToast fToast = FToast();
    fToast.init(context);
    fToast.removeQueuedCustomToasts();
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.black87,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.delete,
            color: Colors.white70,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            txt,
            style: const TextStyle(color: kWhite),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: position ?? ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  showComingSoonNotification(String txt, {ToastGravity? position}) {
    FToast fToast = FToast();
    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.black87,
      ),
      child: Text(
        txt,
        style: const TextStyle(
          color: kWhite,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: position ?? ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }
}
