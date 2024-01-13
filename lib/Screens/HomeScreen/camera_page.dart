import 'dart:io';

import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Screens/HomeScreen/Backend/Provider/home_screen_base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CameraPage extends ConsumerStatefulWidget {
  const CameraPage({super.key});

  @override
  ConsumerState<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends ConsumerState<CameraPage> {
  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(homeScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return FlutterCamera(
      color: kYellow,
      onImageCaptured: (value) {
        baseModel.setCameraImage(context, value as File);
      },
      onVideoRecorded: (value) {
        final path = value.path;
        print('::::::::::::::::::::::::;; dkdkkd $path');
      },
    );
  }
}
