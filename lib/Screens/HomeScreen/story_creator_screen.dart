import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_maker/story_maker.dart';

class StoryCreatorScreen extends StatefulWidget {
  @override
  _StoryCreatorScreenState createState() => _StoryCreatorScreenState();
}

class _StoryCreatorScreenState extends State<StoryCreatorScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  TextEditingController textEditingController = TextEditingController();

  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Story Creator'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              // Handle the action when the user clicks the checkmark button
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: imagePath != null
                ? StoryMaker(
                    filePath: imagePath!,

                    // fit: BoxFit.cover,
                  )
                : Container(
                    // Display the image or video content here
                    color: Colors.black,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.camera),
                  onPressed: () async {
                    // Handle the action when the user clicks the camera button
                    final pickedFile = await _imagePicker.pickImage(
                        source: ImageSource.camera);

                    setState(() {
                      imagePath = pickedFile!.path;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.image),
                  onPressed: () async {
                    // Handle the action when the user clicks the camera button
                    final pickedFile = await _imagePicker.pickImage(
                        source: ImageSource.gallery);

                    setState(() {
                      imagePath = pickedFile!.path;
                    });
                  },
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.brush),
                  onPressed: () {
                    // Handle the action when the user clicks the brush button
                    // showDrawingScreen();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
