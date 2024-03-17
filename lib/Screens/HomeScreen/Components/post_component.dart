import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:barber_klipz_ui/Screens/HomeScreen/Components/flicks_view.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../Resources/color_const.dart';
import '../../../Utils/navigator_util.dart';
import '../../../Utils/net_image.dart';
import '../../../Utils/text_util.dart';
import '../../ViewAllCommentsScreen/view_all_comments_screen.dart';
import '../Backend/Model/post_model.dart';
import '../Backend/Provider/home_screen_base_model.dart';

class PostComponent extends ConsumerStatefulWidget {
  const PostComponent({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PostComponentState();
}

class _PostComponentState extends ConsumerState<PostComponent> {
  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(homeScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenUtil.setWidth(10),
        vertical: screenUtil.setHeight(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: screenUtil.setHeight(30),
                width: screenUtil.setHeight(30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border:
                      Border.all(width: screenUtil.setWidth(1), color: kGold),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: NetImage(
                      fit: BoxFit.cover,
                      uri: widget.post.user.profile_image,
                    )),
              ),
              SizedBox(
                width: screenUtil.setWidth(12),
              ),
              TextUtil.secondaryText(
                text: widget.post.user.user_name,
                color: kTextBody,
                size: 15,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
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
                icon: const Icon(Icons.more_horiz),
              )
            ],
          ),
          SizedBox(
            height: screenUtil.setHeight(5),
          ),
          widget.post.media_type == 'FLICKS'
              ? FlicksView(
                  mediaUrl: widget.post.media_url,
                )
              : SizedBox(
                  height: screenUtil.setHeight(300),
                  child: NetImage(
                    uri: widget.post.media_url,
                    fit: BoxFit.cover,
                  ),
                ),
          SizedBox(
            height: screenUtil.setHeight(8),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  baseModel.likeAndUnlikePost(
                    context,
                    widget.post,
                  );
                },
                child: widget.post.liked
                    ? const Icon(Icons.thumb_up_alt_rounded)
                    : const Icon(Icons.thumb_up_alt_outlined),
              ),
              SizedBox(
                width: screenUtil.setWidth(15),
              ),
              GestureDetector(
                onTap: () {
                  NavigatorUtil.push(
                    context,
                    screen: ViewAllCommentsScreen(
                      postModel: widget.post,
                    ),
                  );
                },
                child: const Icon(Icons.message),
              ),
              SizedBox(
                width: screenUtil.setWidth(15),
              ),
              const Icon(Icons.cut_outlined),
              SizedBox(
                width: screenUtil.setWidth(15),
              ),
              const Icon(Icons.share),
              const Spacer(),
              TextUtil.secondaryText(
                text: timeago.format(DateTime.parse(widget.post.created_at)),
                color: kTextSubTitle,
                size: 11,
              )
            ],
          ),
          SizedBox(
            height: screenUtil.setHeight(8),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextUtil.secondaryText(
                text: "${widget.post.likes_count} likes",
                color: kBlack,
                size: 12,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                width: screenUtil.setWidth(10),
              ),
              TextUtil.secondaryText(
                text: "${widget.post.loves_count} faded points",
                color: kBlack,
                size: 12,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
          SizedBox(
            height: screenUtil.setHeight(8),
          ),
          TextUtil.secondaryText(
            text: widget.post.caption,
            color: kBlack,
            size: 12,
          ),
          SizedBox(
            height: screenUtil.setHeight(8),
          ),
          widget.post.comments_count > 0
              ? GestureDetector(
                  onTap: () {
                    NavigatorUtil.push(
                      context,
                      screen: ViewAllCommentsScreen(
                        postModel: widget.post,
                      ),
                    );
                  },
                  child: TextUtil.secondaryText(
                    text: "View all ${widget.post.comments_count} comments",
                    color: kTextSubTitle,
                    size: 12,
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
