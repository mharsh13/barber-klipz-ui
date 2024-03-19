import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../Resources/color_const.dart';
import '../../Utils/text_util.dart';
import 'Backend/Provider/view_flickz_base_model.dart';
import 'Components/reel_component.dart';

class ViewFlickzScreen extends ConsumerStatefulWidget {
  const ViewFlickzScreen({
    super.key,
  });

  @override
  ConsumerState<ViewFlickzScreen> createState() => _ViewFlickzScreenState();
}

class _ViewFlickzScreenState extends ConsumerState<ViewFlickzScreen> {
  VideoPlayerController? _videoPlayerController;
  bool isLoading = true;

  @override
  void initState() {
    final baseModel = ref.read(viewFlickzBaseModel);
    baseModel.getAllUserFlickz(context);
    initialize();
    super.initState();
  }

  void initialize() {
    final baseModel = ref.read(viewFlickzBaseModel);
    _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(baseModel.allPosts[0].media_url))
      ..initialize().then((_) {
        isLoading = false;
        setState(() {});
      });
    if (_videoPlayerController != null) {
      _videoPlayerController!.play();
      _videoPlayerController!.setLooping(true);
    }
  }

  @override
  void dispose() {
    if (_videoPlayerController != null) {
      _videoPlayerController!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(viewFlickzBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: "Flickz",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        leading: const BackButton(
          color: kWhite,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(right: screenUtil.setWidth(8)),
              child: const Icon(
                Icons.camera_alt_outlined,
                color: kWhite,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Swiper(
              containerHeight: screenUtil.screenHeight,
              itemHeight: screenUtil.screenHeight,
              itemCount: baseModel.allPosts.length,
              itemBuilder: (context, i) {
                return ReelComponent(
                  videoPlayerController: _videoPlayerController!,
                  isLoading: isLoading,
                );
              },
              scrollDirection: Axis.vertical,
              onIndexChanged: (int index) async {
                await _videoPlayerController!.pause();
                await _videoPlayerController!.dispose();
                isLoading = true;
                setState(() {});
                _videoPlayerController = VideoPlayerController.networkUrl(
                  Uri.parse(baseModel.allPosts[index].media_url),
                )..initialize().then((_) {
                    isLoading = false;
                    setState(() {});
                  });

                await _videoPlayerController!.play();
                await _videoPlayerController!.setLooping(true);
              },
              loop: true,
            ),
          ),
        ],
      ),
    );
  }
}
