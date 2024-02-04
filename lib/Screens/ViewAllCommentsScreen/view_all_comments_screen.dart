import 'package:barber_klipz_ui/Screens/HomeScreen/Backend/Model/post_model.dart';
import 'package:barber_klipz_ui/Screens/SplashScreen/Backend/Provider/splash_base_model.dart';
import 'package:barber_klipz_ui/Screens/ViewAllCommentsScreen/Backend/Provider/view_all_comments_base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../Resources/color_const.dart';
import '../../Utils/net_image.dart';
import '../../Utils/text_util.dart';

// ignore: must_be_immutable
class ViewAllCommentsScreen extends ConsumerStatefulWidget {
  PostModel postModel;
  ViewAllCommentsScreen({super.key, required this.postModel});

  @override
  ConsumerState<ViewAllCommentsScreen> createState() =>
      _ViewAllCommentsScreenState();
}

class _ViewAllCommentsScreenState extends ConsumerState<ViewAllCommentsScreen> {
  @override
  void initState() {
    final baseModel = ref.read(viewAllCommentsBaseModel);
    getComments(baseModel);
    super.initState();
  }

  void getComments(ViewAllComentsBaseModel baseModel) {
    baseModel.getAllComments(context, widget.postModel.id);
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(viewAllCommentsBaseModel);
    final splashBaseModel = ref.watch(splashScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: "Comments",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        leading: const BackButton(
          color: kWhite,
        ),
        leadingWidth: screenUtil.setWidth(25),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(10),
          vertical: screenUtil.setHeight(10),
        ),
        color: kWhite,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: kYellow),
              ),
              width: screenUtil.setHeight(40),
              height: screenUtil.setHeight(40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: NetImage(
                  uri: splashBaseModel.user!.profile_image,
                ),
              ),
            ),
            SizedBox(
              width: screenUtil.setWidth(5),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: TextFormField(
                  maxLines: 3,
                  minLines: 1,
                  controller: baseModel.enterComment,
                  cursorColor: kBlack,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(top: 13, bottom: 13, left: 10),
                    hintText: "Type a comment",
                    hintStyle: const TextStyle(
                      fontSize: 16,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () async {
                        await baseModel.createComment(
                            context, widget.postModel.id);
                      },
                      child: Padding(
                          padding: EdgeInsets.only(
                            right: screenUtil.setWidth(10),
                            top: screenUtil.setHeight(12),
                          ),
                          child: TextUtil.secondaryText(
                            text: "Post",
                            color: kCategoryText,
                            size: 14,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
      body: baseModel.loader
          ? const Center(
              child: CircularProgressIndicator(
                color: kYellow,
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: screenUtil.setHeight(8),
                ),
                height: screenUtil.setHeight(560),
                child: ListView.builder(
                  itemCount: baseModel.allComments.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenUtil.setWidth(20),
                      ),
                      child: Column(
                        children: [
                          Slidable(
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {},
                                  backgroundColor: kTextSubTitle,
                                  foregroundColor: Colors.white,
                                  icon: Icons.reply,
                                ),
                                SlidableAction(
                                  onPressed: (context) {},
                                  backgroundColor: kTextSubTitle,
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  width: screenUtil.setHeight(40),
                                  height: screenUtil.setHeight(40),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: NetImage(
                                      uri: baseModel.allComments[index].user
                                          .profile_image,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: screenUtil.setWidth(10),
                                ),
                                SizedBox(
                                  width: screenUtil.screenWidth - 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextUtil.secondaryText(
                                                text: baseModel
                                                    .allComments[index]
                                                    .user
                                                    .user_name,
                                                color: kBlack,
                                                size: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              TextUtil.secondaryText(
                                                text: baseModel
                                                    .allComments[index].text,
                                                color: kBlack,
                                                size: 12,
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () {
                                              baseModel.likeAndUnlikeComment(
                                                  context,
                                                  baseModel.allComments[index]);
                                            },
                                            icon: Icon(
                                              baseModel.allComments[index].liked
                                                  ? Icons.favorite
                                                  : Icons
                                                      .favorite_border_outlined,
                                              color: baseModel
                                                      .allComments[index].liked
                                                  ? kError
                                                  : kBlack,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          TextUtil.secondaryText(
                                            text: timeago.format(DateTime.parse(
                                                baseModel.allComments[index]
                                                    .created_at)),
                                            color: kBlack,
                                            size: 10,
                                          ),
                                          SizedBox(
                                            width: screenUtil.setWidth(7),
                                          ),
                                          TextUtil.secondaryText(
                                            text:
                                                "${baseModel.allComments[index].likes_count} Loves",
                                            color: kBlack,
                                            size: 10,
                                          ),
                                          SizedBox(
                                            width: screenUtil.setWidth(7),
                                          ),
                                          TextUtil.secondaryText(
                                            text: "Reply",
                                            color: kTextSubTitle,
                                            size: 10,
                                            fontWeight: FontWeight.w600,
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
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
