// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import "package:http_parser/http_parser.dart";
import 'package:image/image.dart' as img;
import 'package:photofilters/photofilters.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import '../../../../Helpers/api_helpers.dart';
import '../../../../Resources/color_const.dart';
import '../../../../Utils/navigator_util.dart';
import '../../../../Utils/text_util.dart';
import '../../../../Utils/toast_util.dart';

import '../Model/post_model.dart';
import '../Model/story_model.dart';

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
  final List<UserModel> _allUsersWithStories = [];
  final List<StoryModel> _allStories = [];
  bool _loader = false;
  bool _isLike = false;
  final TextEditingController _replyStory = TextEditingController();
  int _currentPage = 0;

  //getters
  ScreenUtil get screenUtil => _screenUtil;
  ImagePicker get imagePicker => _imagePicker;
  String? get imagePath => _imagePath;
  File? get storyImage => _storyImage;
  ApiHelper get apiHelper => _apiHelper;
  List<PostModel> get allPosts => _allPosts;
  List<UserModel> get allUsersWithStories => _allUsersWithStories;
  List<StoryModel> get allStories => _allStories;
  bool get loader => _loader;
  bool get islike => _isLike;
  int get currentPage => _currentPage;

  TextEditingController get replyStory => _replyStory;

  void setStoryImageNull() async {
    _storyImage = null;
    notifyListeners();
  }

  void setIndex(int index) {
    _currentPage = index;
    notifyListeners();
  }

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

  void setCameraImage(BuildContext context, XFile value) {
    if (value.path.contains('.jpg') ||
        value.path.contains('.jpeg') ||
        value.path.contains('.png')) {
      _storyImage = File(value.path);
      notifyListeners();
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

  Future<List<StoryModel>> getAllStories(
      BuildContext context, String id) async {
    try {
      _loader = true;
      await _apiHelper
          .getData(context: context, url: "story/get-user-stories/$id")
          .then((value) {
        _loader = false;
        _allStories.clear();
        if (value != null) {
          List data = value["data"];
          for (Map<String, dynamic> story in data) {
            _allStories.add(StoryModel.fromMap(story));
          }
        }
      });
      notifyListeners();
      return _allStories;
    } catch (e) {
      _loader = false;
      ToastUtil(context).showErrorToastNotification("Something went wrong");
      return [];
    }
  }

  Future<void> getAllUsersWithStories(BuildContext context) async {
    try {
      Loader.show(
        context,
        progressIndicator: const CircularProgressIndicator(
          color: kYellow,
        ),
      );
      await _apiHelper
          .getData(context: context, url: "story/get-all/users")
          .then((value) {
        Loader.hide();
        _allUsersWithStories.clear();
        if (value != null) {
          List data = value["data"];
          for (Map<String, dynamic> user in data) {
            print(user);
            _allUsersWithStories.add(UserModel.fromMap(user));
          }
        }
      });
      notifyListeners();
    } catch (e) {
      print(e);
      Loader.hide();
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }

  Future<void> createStory(BuildContext context, File file) async {
    try {
      Loader.show(
        context,
        progressIndicator: const CircularProgressIndicator(
          color: kYellow,
        ),
      );
      notifyListeners();
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap({
        "media_type": "IMAGE",
        "media": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: MediaType(
            "image",
            'png,jpg,jpeg',
          ),
        ),
      });
      await _apiHelper
          .postData(context: context, data: formData, url: "story/create")
          .then((value) {
        Loader.hide();
        if (value != null) {
          ToastUtil(context)
              .showSuccessToastNotification("Story created successfully");
        }
      });
      notifyListeners();
    } catch (e) {
      Loader.hide();
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

  //like and unlike a particular post
  Future<void> likeAndUnlikeStory(
      BuildContext context, StoryModel storyModel) async {
    try {
      await _apiHelper
          .postData(
              context: context,
              data: {},
              url: "story/toggle-like/${storyModel.id}")
          .then((value) {
        if (value != null) {
          if (value["message"] == "Story liked successfully") {
            storyModel.liked = true;
            storyModel.likes_count++;
            ToastUtil(context)
                .showSuccessToastNotification("Story liked successfully");
          } else if (value["message"] == "Story disliked successfully") {
            storyModel.liked = false;
            storyModel.likes_count--;
            ToastUtil(context)
                .showSuccessToastNotification("Story disliked successfully");
          }
        }
        notifyListeners();
      });
    } catch (e) {
      notifyListeners();
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }

  Future<void> viewStory(BuildContext context, StoryModel storyModel) async {
    try {
      await _apiHelper
          .postData(
              context: context,
              data: {},
              url: "story/toggle-view/${storyModel.id}")
          .then((value) {
        if (value != null && value['data'] != null) {}
      });
    } catch (e) {
      notifyListeners();
      ToastUtil(context).showErrorToastNotification("Something went wrong");
    }
  }
}
