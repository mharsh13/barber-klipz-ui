import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final notificationSettingsBaseModel =
    ChangeNotifierProvider((ref) => NotificationSettingsBaseModel(ref));

class NotificationSettingsBaseModel extends ChangeNotifier {
  final Ref ref;
  NotificationSettingsBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  bool _comments = false;
  bool _like = false;
  bool _loves = false;
  bool _lives = false;
  bool _directMessages = false;
  bool _followers = false;
  bool _subscribers = false;
  bool _audioVideo = false;
  bool _camps = false;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  bool get comments => _comments;
  bool get like => _like;
  bool get loves => _loves;
  bool get lives => _lives;
  bool get directMessages => _directMessages;
  bool get followers => _followers;
  bool get subscribers => _subscribers;
  bool get audioVideo => _audioVideo;
  bool get camps => _camps;

  //functions

  void enableComments(bool value) {
    _comments = value;
    notifyListeners();
  }

  void enableLikes(bool value) {
    _like = value;
    notifyListeners();
  }

  void enableLoves(bool value) {
    _loves = value;
    notifyListeners();
  }

  void enableLives(bool value) {
    _lives = value;
    notifyListeners();
  }

  void enableDirectMessages(bool value) {
    _directMessages = value;
    notifyListeners();
  }

  void enableFollowers(bool value) {
    _followers = value;
    notifyListeners();
  }

  void enableSubscribers(bool value) {
    _subscribers = value;
    notifyListeners();
  }

  void enableAudiVideo(bool value) {
    _audioVideo = value;
    notifyListeners();
  }

  void enableAudioCamps(bool value) {
    _camps = value;
    notifyListeners();
  }
}
