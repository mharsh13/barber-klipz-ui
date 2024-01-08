import 'package:barber_klipz_ui/Screens/ViewFlickzScreen/Backend/Provider/view_flickz_base_model.dart';
import 'package:barber_klipz_ui/Utils/net_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/text_util.dart';

class ReelComponent extends ConsumerStatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool isLoading;
  const ReelComponent(
      {super.key,
      required this.videoPlayerController,
      required this.isLoading});

  @override
  ConsumerState<ReelComponent> createState() => _ReelComponentState();
}

class _ReelComponentState extends ConsumerState<ReelComponent> {
  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(viewFlickzBaseModel);
    final screenUtil = baseModel.screenUtil;
    bool isLike = true;
    return Stack(
      fit: StackFit.expand,
      children: [
        widget.isLoading
            ? Container(
                height: double.infinity,
                width: double.infinity,
                color: kBlack,
                child: const SpinKitFadingCircle(color: kGrey),
              )
            : Container(
                color: kBlack,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 9 / 16,
                      child: SizedBox(
                        width: double.infinity,
                        child: VideoPlayer(
                          widget.videoPlayerController,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: screenUtil.setHeight(200),
            width: screenUtil.scaleWidth,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black87,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: screenUtil.setHeight(35),
          left: 0,
          right: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: screenUtil.setWidth(280),
                height: screenUtil.setHeight(65),
                padding: EdgeInsets.only(
                  left: screenUtil.setWidth(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextUtil.secondaryText(
                      text: "Helloooooooooooooooo",
                      color: kWhite,
                      size: 15,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(8),
                    ),
                    TextUtil.secondaryText(
                      text: 'Barber Klipz',
                      color: kWhite,
                      size: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenUtil.setWidth(10),
              ),
              SizedBox(
                width: screenUtil.setWidth(60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: NetImage(
                        uri:
                            "https://th.bing.com/th/id/OIG.gq_uOPPdJc81e_v0XAei",
                        height: screenUtil.setHeight(30),
                        width: screenUtil.setHeight(30),
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(17),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.thumb_up_alt_outlined,
                        color: kWhite,
                        size: 28,
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(5),
                    ),
                    TextUtil.secondaryText(
                      text: "0",
                      color: kWhite,
                      size: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(17),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        isLike
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: isLike ? Colors.red.shade600 : kWhite,
                        size: 28,
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(5),
                    ),
                    TextUtil.secondaryText(
                      text: "0",
                      color: kWhite,
                      size: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(17),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.message,
                        color: kWhite,
                        size: 28,
                      ),
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(5),
                    ),
                    TextUtil.secondaryText(
                      text: "0",
                      color: kWhite,
                      size: 12,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(17),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.share,
                        size: 23,
                        color: kWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
