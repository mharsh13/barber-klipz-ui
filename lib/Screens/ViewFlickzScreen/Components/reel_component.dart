import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:barber_klipz_ui/Screens/ViewFlickzScreen/Backend/Provider/view_flickz_base_model.dart';
import 'package:barber_klipz_ui/Utils/net_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
                      onTap: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return SizedBox(
                              height: 400,
                              child: Column(
                                children: [
                                  Container(
                                    height: 6,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: kTextSubTitle,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        top: screenUtil.setHeight(8),
                                        left: screenUtil.setWidth(8),
                                        right: screenUtil.setWidth(8),
                                      ),
                                      height: screenUtil.setHeight(282),
                                      child: ListView.builder(
                                        itemCount: 12,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Slidable(
                                                endActionPane: ActionPane(
                                                  motion: const ScrollMotion(),
                                                  children: [
                                                    SlidableAction(
                                                      flex: 2,
                                                      onPressed: (context) {},
                                                      backgroundColor:
                                                          kTextSubTitle,
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: Icons.reply,
                                                    ),
                                                    SlidableAction(
                                                      onPressed: (context) {},
                                                      backgroundColor:
                                                          kTextSubTitle,
                                                      foregroundColor:
                                                          Colors.white,
                                                      icon: Icons.info_outline,
                                                    ),
                                                  ],
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                      ),
                                                      width: screenUtil
                                                          .setHeight(40),
                                                      height: screenUtil
                                                          .setHeight(40),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        child: const NetImage(
                                                          uri:
                                                              "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: screenUtil
                                                          .setWidth(10),
                                                    ),
                                                    SizedBox(
                                                      width: screenUtil
                                                              .screenWidth -
                                                          75,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  TextUtil
                                                                      .secondaryText(
                                                                    text:
                                                                        "George",
                                                                    color:
                                                                        kBlack,
                                                                    size: 12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                  ),
                                                                  TextUtil
                                                                      .secondaryText(
                                                                    text:
                                                                        "Amazing🤩",
                                                                    color:
                                                                        kBlack,
                                                                    size: 12,
                                                                  ),
                                                                ],
                                                              ),
                                                              const Spacer(),
                                                              Icon(
                                                                baseModel
                                                                        .isFavourite
                                                                    ? Icons
                                                                        .favorite
                                                                    : Icons
                                                                        .favorite_border_outlined,
                                                                color: baseModel
                                                                        .isFavourite
                                                                    ? kError
                                                                    : kBlack,
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              TextUtil
                                                                  .secondaryText(
                                                                text: "3d",
                                                                color: kBlack,
                                                                size: 10,
                                                              ),
                                                              SizedBox(
                                                                width: screenUtil
                                                                    .setWidth(
                                                                        7),
                                                              ),
                                                              TextUtil
                                                                  .secondaryText(
                                                                text: "0 Loves",
                                                                color: kBlack,
                                                                size: 10,
                                                              ),
                                                              SizedBox(
                                                                width: screenUtil
                                                                    .setWidth(
                                                                        7),
                                                              ),
                                                              TextUtil
                                                                  .secondaryText(
                                                                text: "Reply",
                                                                color:
                                                                    kTextSubTitle,
                                                                size: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: screenUtil.setHeight(5),
                                              ),
                                              const Divider(
                                                color: kGrey,
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: screenUtil.setWidth(10),
                                      vertical: screenUtil.setHeight(10),
                                    ),
                                    width: screenUtil.screenWidth,
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          width: screenUtil.setHeight(40),
                                          height: screenUtil.setHeight(40),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: const NetImage(
                                              uri:
                                                  "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenUtil.setWidth(5),
                                        ),
                                        SizedBox(
                                          width: screenUtil.setWidth(292),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            child: TextFormField(
                                              maxLines: 3,
                                              minLines: 1,
                                              controller:
                                                  baseModel.enterComment,
                                              cursorColor: kBlack,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        top: 13,
                                                        bottom: 13,
                                                        left: 10),
                                                hintText: "Type a comment",
                                                hintStyle: const TextStyle(
                                                  fontSize: 16,
                                                ),
                                                suffixIcon: Padding(
                                                    padding: EdgeInsets.only(
                                                        right: screenUtil
                                                            .setWidth(10),
                                                        top: screenUtil
                                                            .setHeight(12)),
                                                    child:
                                                        TextUtil.secondaryText(
                                                      text: "Post",
                                                      color: kCategoryText,
                                                      size: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    )),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              20.0)),
                                                  borderSide: BorderSide(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              20.0)),
                                                  borderSide: BorderSide(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
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
                    SizedBox(
                      height: screenUtil.setHeight(17),
                    ),
                    InkWell(
                      onTap: () {
                        showAdaptiveActionSheet(
                          context: context,
                          isDismissible: true,
                          title: Container(
                            height: 6,
                            width: 40,
                            decoration: BoxDecoration(
                              color: kTextSubTitle,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          androidBorderRadius: 30,
                          actions: <BottomSheetAction>[
                            BottomSheetAction(
                              title: Row(
                                children: [
                                  const Icon(
                                    Icons.report_gmailerrorred,
                                    color: kError,
                                    size: 28,
                                  ),
                                  SizedBox(
                                    width: screenUtil.setWidth(7),
                                  ),
                                  TextUtil.secondaryText(
                                    text: "Report",
                                    color: kError,
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                              onPressed: (context) {},
                            ),
                          ],
                        );
                      },
                      child: const Icon(
                        Icons.more_horiz,
                        size: 25,
                        color: kWhite,
                      ),
                    )
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
