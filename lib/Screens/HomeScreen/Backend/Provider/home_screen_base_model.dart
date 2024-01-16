// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:image/image.dart' as img;
import 'package:photofilters/photofilters.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Resources/color_const.dart';
import '../../../../Utils/navigator_util.dart';
import '../../../../Utils/text_util.dart';
import '../../../../Utils/toast_util.dart';
import '../../story_creator_screen.dart';
import '../Model/post_model.dart';

final homeScreenBaseModel =
    ChangeNotifierProvider((ref) => HomeScreenBaseModel(ref));

class HomeScreenBaseModel extends ChangeNotifier {
  final Ref ref;
  HomeScreenBaseModel(this.ref);

  //variables
  final ScreenUtil _screenUtil = ScreenUtil();
  final ImagePicker _imagePicker = ImagePicker();
  String? _imagePath;
  File? _storyImage;
  final ApiHelper _apiHelper = ApiHelper();
  final List<PostModel> _allPosts = [];
  bool _loader = false;
  bool _isLike = false;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  ImagePicker get imagePicker => _imagePicker;
  String? get imagePath => _imagePath;
  File? get storyImage => _storyImage;
  ApiHelper get apiHelper => _apiHelper;
  List<PostModel> get allPosts => _allPosts;
  bool get loader => _loader;
  bool get islike => _isLike;

  //selects profile picture of user from gallery
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

        _storyImage = File(croppedFile!.path);
      }
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void setCameraImage(BuildContext context, File value) {
    _storyImage = value;
    if (_storyImage!.path.contains('.jpg') ||
        _storyImage!.path.contains('.jpeg') ||
        _storyImage!.path.contains('.png')) {
      NavigatorUtil.push(context, screen: const StoryCreatorScreen());
    }
  }

  //selects profile picture of user from camera
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

        _storyImage = File(croppedFile!.path);
      }
      notifyListeners();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void setStoryFilter(BuildContext context) async {
    File? selectedImage = File(_storyImage!.path);
    String? fileName = basename(_storyImage!.path);
    var image = img.decodeImage(await selectedImage.readAsBytes());
    image = img.copyResize(image!, width: 600);
    var imageFile = NavigatorUtil.push(
      context,
      screen: PhotoFilterSelector(
        appBarColor: kYellow,
        title: TextUtil.secondaryText(
          text: "Filter",
          color: kBlack,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        image: image,
        filters: presetFiltersList,
        filename: fileName,
        loader: const Center(child: CircularProgressIndicator()),
        fit: BoxFit.contain,
      ),
    );
    if (imageFile != null && imageFile.containsKey('image_filtered')) {
      _storyImage = imageFile['image_filtered'];
      notifyListeners();
    }
  }

  //API functions

  //gets the list of all the posts
  Future<void> getAllPosts(BuildContext context) async {
    try {
      _loader = true;
      await _apiHelper
          .getData(context: context, url: "post/get-all")
          .then((value) {
        _loader = false;
        _allPosts.clear();
        if (value != null) {
          List data = value["data"];
          for (Map<String, dynamic> post in data) {
            _allPosts.add(PostModel.fromMap(post));
          }
        }
      });
      notifyListeners();
    } catch (e) {
      _loader = false;
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }

  //like and unlike a particular post
  Future<void> likeAndUnlikePost(
      BuildContext context, PostModel postModel) async {
    try {
      Loader.show(
        context,
        progressIndicator: const CircularProgressIndicator(
          color: kPrimary,
        ),
      );
      await _apiHelper
          .postData(
              context: context,
              data: {},
              url: "post/toggle-like/${postModel.id}")
          .then((value) {
        Loader.hide();
        if (value != null) {
          if (value["message"] == "Post liked successfully") {
            postModel.liked = true;
            postModel.likes_count++;
            _isLike = true;
            ToastUtil(context)
                .showSuccessToastNotification("Post liked successfully");
          } else if (value["message"] == "Post disliked successfully") {
            postModel.liked = false;
            postModel.likes_count--;
            _isLike = false;
            ToastUtil(context)
                .showSuccessToastNotification("Post disliked successfully");
          }
        }
        notifyListeners();
      });
    } catch (e) {
      Loader.hide();
      notifyListeners();
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }
}
