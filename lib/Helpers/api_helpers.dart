// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Utils/toast_util.dart';
import '../global.dart';

class ApiHelper {
  final Dio _dio = Dio();

  void getHeader() {
    _dio.options.contentType = 'application/json';
    _dio.options.headers['Content-Type'] = 'application/json';
    _dio.options.headers["Authorization"] = "Bearer ${Global.jwt}";
  }

  Future<Map<String, dynamic>?> postData({
    required BuildContext context,
    required dynamic data,
    required String url,
  }) async {
    getHeader();

    Map<String, dynamic>? res;
    try {
      _dio.options.method = "POST";
      await _dio
          .post(
        Global.baseURL + url,
        data: data,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return true;
          },
        ),
      )
          .then((response) async {
        if (response.statusCode == 201 || response.statusCode == 200) {
          res = response.data as Map<String, dynamic>;
        } else {
          res = response.data as Map<String, dynamic>;
          if (res!["message"].runtimeType == [].runtimeType) {
            ToastUtil(context).showErrorToastNotification(res!["message"][0]);
          } else {
            ToastUtil(context).showErrorToastNotification(res!["message"]);
          }
        }
      }).catchError((e) {});
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return res;
  }

  Future<Map<String, dynamic>?> putData({
    required BuildContext context,
    required dynamic data,
    required String url,
  }) async {
    getHeader();

    Map<String, dynamic>? res;
    try {
      _dio.options.method = "PUT";
      await _dio
          .put(
        Global.baseURL + url,
        data: data,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return true;
          },
        ),
      )
          .then((response) {
        if (response.statusCode == 201 || response.statusCode == 200) {
          res = response.data as Map<String, dynamic>;
        } else {
          res = response.data as Map<String, dynamic>;
          if (res!["message"].runtimeType == [].runtimeType) {
            ToastUtil(context).showErrorToastNotification(res!["message"][0]);
          } else {
            ToastUtil(context).showErrorToastNotification(res!["message"]);
          }
        }
      }).catchError((e) {});
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return res;
  }

  Future<Map<String, dynamic>?> getData({
    required BuildContext context,
    required String url,
  }) async {
    getHeader();

    Map<String, dynamic>? res;
    try {
      _dio.options.method = "GET";
      await _dio
          .get(
        Global.baseURL + url,
      )
          .then((response) {
        if (response.statusCode == 200) {
          res = response.data;
        } else {
          res = response.data as Map<String, dynamic>;
          if (res!["message"].runtimeType == [].runtimeType) {
            ToastUtil(context).showErrorToastNotification(res!["message"][0]);
          } else {
            ToastUtil(context).showErrorToastNotification(res!["message"]);
          }
        }
      });
    } catch (e) {
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
    return res;
  }

  Future<Map<String, dynamic>?> patchData({
    required BuildContext context,
    required dynamic data,
    required String url,
  }) async {
    getHeader();
    Map<String, dynamic>? res;
    try {
      _dio.options.method = "PATCH";
      await _dio
          .patch(
        Global.baseURL + url,
        data: data,
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return true;
          },
        ),
      )
          .then((response) {
        if (response.statusCode == 200) {
          res = response.data;
        } else {
          res = response.data as Map<String, dynamic>;
          if (res!["message"].runtimeType == [].runtimeType) {
            ToastUtil(context).showErrorToastNotification(res!["message"][0]);
          } else {
            ToastUtil(context).showErrorToastNotification(res!["message"]);
          }
        }
      });
    } catch (e) {
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
    return res;
  }

  Future<void> deleteData({
    required BuildContext context,
    required String url,
  }) async {
    getHeader();

    try {
      _dio.options.method = "DELETE";
      await _dio
          .delete(
        Global.baseURL + url,
      )
          .then((response) {
        if (response.statusCode == 204) {
          return;
        } else {
          switch (response.statusCode) {
            case 400:
              ToastUtil(context).showErrorToastNotification('Bad request');
              break;
            case 401:
              ToastUtil(context).showErrorToastNotification('Unauthorized');
              break;
            case 402:
              ToastUtil(context).showErrorToastNotification('Payment required');
              break;
            case 403:
              ToastUtil(context).showErrorToastNotification('Payment required');
              break;
            case 404:
              ToastUtil(context).showErrorToastNotification('Not found');
              break;
            case 500:
              ToastUtil(context)
                  .showErrorToastNotification('Internal Server Error');
              break;
            default:
              ToastUtil(context)
                  .showErrorToastNotification('Something went wrong');
              break;
          }
        }
      });
    } catch (e) {
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
    return;
  }
}
