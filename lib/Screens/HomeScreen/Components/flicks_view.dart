import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';
import '../../../Resources/color_const.dart';
import '../Backend/Provider/home_screen_base_model.dart';

class FlicksView extends ConsumerStatefulWidget {
  const FlicksView({super.key, required this.mediaUrl});
  final String mediaUrl;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FlicksViewState();
}

class _FlicksViewState extends ConsumerState<FlicksView> {
  VideoPlayerController? _videoPlayerController;
  bool isLoading = true;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  void initialize() {
    _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(
      widget.mediaUrl,
    ))
      ..initialize().then((_) {
        isLoading = false;
        setState(() {});
      });
    if (_videoPlayerController != null) {
      // _videoPlayerController!.play();
      // _videoPlayerController!.setLooping(false);
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
    final baseModel = ref.watch(homeScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return isLoading
        ? Container(
            height: screenUtil.setHeight(300),
            width: double.infinity,
            color: kBlack,
            child: const SpinKitFadingCircle(color: kGrey),
          )
        : Container(
            color: kBlack,
            child: AspectRatio(
              aspectRatio: 9 / 16,
              child: GestureDetector(
                onTap: () {
                  if (_videoPlayerController != null) {
                    _videoPlayerController?.play();
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  child: VideoPlayer(
                    _videoPlayerController!,
                  ),
                ),
              ),
            ),
          );
  }
}
