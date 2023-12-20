import 'dart:io';

import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Screens/AddPostScreen/add_caption_screen.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:barber_klipz_ui/Utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photofilters/filters/filters.dart';
import 'package:photofilters/filters/preset_filters.dart';
import 'package:photofilters/widgets/photo_filter.dart';
import 'package:image/image.dart' as img;
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class AddFilterScreen extends ConsumerStatefulWidget {
  const AddFilterScreen({super.key});
  @override
  ConsumerState<AddFilterScreen> createState() => _AddFilterScreenState();
}

class _AddFilterScreenState extends ConsumerState<AddFilterScreen> {
  String? fileName;
  List<Filter> filters = presetFiltersList;
  final picker = ImagePicker();
  File? selectedImage;
  Future getImage(context) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      fileName = basename(selectedImage!.path);
      var image = img.decodeImage(await selectedImage!.readAsBytes());
      image = img.copyResize(image!, width: 600);
      var imageFile = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PhotoFilterSelector(
            appBarColor: kBlack2,
            title: TextUtil.secondaryText(
              text: "Filter",
              color: kGold,
              size: 18,
              fontWeight: FontWeight.w600,
            ),
            image: image!,
            filters: presetFiltersList,
            filename: fileName!,
            loader: const Center(child: CircularProgressIndicator()),
            fit: BoxFit.contain,
          ),
        ),
      );
      if (imageFile != null && imageFile.containsKey('image_filtered')) {
        setState(() {
          selectedImage = imageFile['image_filtered'];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        leading: const BackButton(
          color: kWhite,
        ),
        title: TextUtil.secondaryText(
          text: "Filter",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              NavigatorUtil.push(context, screen: const AddCaptionScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
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
          child: selectedImage == null
              ? const Center(
                  child: Text('No image selected.'),
                )
              : Image.file(File(selectedImage!.path)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kYellow,
        onPressed: () => getImage(context),
        tooltip: 'Pick Image',
        child: const Icon(
          Icons.add_a_photo,
        ),
      ),
    );
  }
}
