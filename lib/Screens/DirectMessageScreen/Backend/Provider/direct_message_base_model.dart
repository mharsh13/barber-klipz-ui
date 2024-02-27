import 'dart:io';

import 'package:barber_klipz_ui/Models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Utils/toast_util.dart';

final directMessageBaseModel =
    ChangeNotifierProvider((ref) => DirectMessageBaseModel(ref));

class DirectMessageBaseModel extends ChangeNotifier {
  final Ref ref;
  DirectMessageBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _enterMessage = TextEditingController();
  final ApiHelper _apiHelper = ApiHelper();
  bool _loader = false;
  final List<MessageModel> _chatList = [];
  final ImagePicker _imagePicker = ImagePicker();
  File? _chatImage;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  ScrollController get scrollController => _scrollController;
  TextEditingController get enterMessage => _enterMessage;
  bool get loader => _loader;
  List<MessageModel> get chatList => _chatList;
  ImagePicker get imagePicker => _imagePicker;
  File? get chatImage => _chatImage;

  //methods

  //selects profile picture of influencer from gallery
  Future<void> selectGalleryImage() async {
    try {
      XFile? picture =
          await _imagePicker.pickImage(source: ImageSource.gallery);
      if (picture != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: picture.path,
          aspectRatio: const CropAspectRatio(
            ratioX: 1,
            ratioY: 1,
          ),
        );

        _chatImage = File(croppedFile!.path);
      }
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  //selects profile picture of influencer from camera
  Future<void> selectCameraImage() async {
    try {
      XFile? picture = await _imagePicker.pickImage(source: ImageSource.camera);
      if (picture != null) {
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: picture.path,
          aspectRatio: const CropAspectRatio(
            ratioX: 1,
            ratioY: 1,
          ),
        );

        _chatImage = File(croppedFile!.path);
      }
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  //API functions

  Future<void> getAllChats(BuildContext context, String id) async {
    try {
      _loader = true;
      await _apiHelper
          .getData(context: context, url: "chat/get-messages/$id")
          .then((value) {
        _loader = false;
        _chatList.clear();
        if (value != null) {
          List data = value["data"];
          for (Map<String, dynamic> chat in data) {
            _chatList.add(MessageModel.fromMap(chat));
          }
        }
      });

      notifyListeners();
    } catch (e) {
      print(e);
      _loader = false;
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }

  void addMessage(MessageModel message) {
    _chatList.add(message);
    notifyListeners();
  }
}
