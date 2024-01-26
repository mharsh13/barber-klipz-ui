import 'dart:io';

import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Screens/AddPostScreen/Backend/Provider/add_post_base_model.dart';
import 'package:barber_klipz_ui/Screens/AddPostScreen/add_caption_screen.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:barber_klipz_ui/Utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddPostScreen extends ConsumerStatefulWidget {
  const AddPostScreen({super.key});
  @override
  ConsumerState<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends ConsumerState<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(addPostBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        leading: const BackButton(
          color: kWhite,
        ),
        title: TextUtil.secondaryText(
          text: "Post",
          color: kGold,
          size: screenUtil.setSp(18),
          fontWeight: FontWeight.w600,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              NavigatorUtil.push(context, screen: const AddCaptionScreen());
            },
            child: Padding(
              padding: EdgeInsets.only(right: screenUtil.setWidth(15)),
              child: TextUtil.secondaryText(
                text: "Next",
                color: kWhite,
                size: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          child: baseModel.selectedImage == null
              ? const Center(
                  child: Text('No image selected.'),
                )
              : Image.file(File(baseModel.selectedImage!.path)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kYellow,
        onPressed: () => baseModel.getImage(context),
        tooltip: 'Pick Image',
        child: const Icon(
          Icons.add_a_photo,
        ),
      ),
    );
  }
}
