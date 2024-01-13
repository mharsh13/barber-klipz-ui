import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:photofilters/photofilters.dart';

import '../../../../Resources/color_const.dart';
import '../../../../Utils/text_util.dart';

final addPostBaseModel = ChangeNotifierProvider((ref) => AddPostBaseModel(ref));

class AddPostBaseModel extends ChangeNotifier {
  final Ref ref;
  AddPostBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final TextEditingController _caption = TextEditingController();
  String? _fileName;
  final List<Filter> _filters = presetFiltersList;
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  XFile? _pickedFile;
  bool _exclusiveContent = false;
  bool _exclusiveContentAgreement = false;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  TextEditingController get caption => _caption;
  String? get fileName => _fileName;
  List<Filter> get filters => _filters;
  ImagePicker get picker => _picker;
  File? get selectedImage => _selectedImage;
  XFile? get pickedFile => _pickedFile;
  bool get exclusiveContent => _exclusiveContent;
  bool get exclusiveContentAgreement => _exclusiveContentAgreement;

  //functions

  //functions

  void enableExclusiveContent(bool value) {
    _exclusiveContent = value;
    notifyListeners();
  }

  void enableExclusiveContentAgreement(bool value) {
    _exclusiveContentAgreement = value;
    notifyListeners();
  }

  Future getImage(context) async {
    _pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      _selectedImage = File(_pickedFile!.path);
      _fileName = basename(_selectedImage!.path);
      var image = img.decodeImage(await _selectedImage!.readAsBytes());
      image = img.copyResize(image!, width: 600);
      var imageFile = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhotoFilterSelector(
            appBarColor: kYellow,
            title: TextUtil.secondaryText(
              text: "Filter",
              color: kBlack,
              size: 18,
              fontWeight: FontWeight.w600,
            ),
            image: image!,
            filters: _filters,
            filename: _fileName!,
            loader: const Center(child: CircularProgressIndicator()),
            fit: BoxFit.contain,
          ),
        ),
      );
      if (imageFile != null && imageFile.containsKey('image_filtered')) {
        _selectedImage = imageFile['image_filtered'];
        notifyListeners();
      }
    }
  }
}
