import 'package:barber_klipz_ui/Screens/ViewAllCommentsScreen/Backend/Provider/view_all_comments_base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/net_image.dart';
import '../../Utils/text_util.dart';

class ViewAllCommentsScreen extends ConsumerWidget {
  const ViewAllCommentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseModel = ref.watch(viewAllCommentsBaseModel);
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenUtil.setWidth(10),
          vertical: screenUtil.setHeight(10),
        ),
        width: screenUtil.screenWidth,
        child: Row(
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
              width: screenUtil.setHeight(40),
              height: screenUtil.setHeight(40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
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
                    suffixIcon: Padding(
                        padding: EdgeInsets.only(
                            right: screenUtil.setWidth(10),
                            top: screenUtil.setHeight(12)),
                        child: TextUtil.secondaryText(
                          text: "Post",
                          color: kCategoryText,
                          size: 14,
                          fontWeight: FontWeight.bold,
                        )),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: screenUtil.setHeight(8),
          ),
          height: screenUtil.setHeight(560),
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
                          backgroundColor: kTextSubTitle,
                          foregroundColor: Colors.white,
                          icon: Icons.reply,
                        ),
                        SlidableAction(
                          onPressed: (context) {},
                          backgroundColor: kTextSubTitle,
                          foregroundColor: Colors.white,
                          icon: Icons.info_outline,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          width: screenUtil.setHeight(40),
                          height: screenUtil.setHeight(40),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: const NetImage(
                              uri:
                                  "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenUtil.setWidth(10),
                        ),
                        SizedBox(
                          width: screenUtil.screenWidth - 65,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextUtil.secondaryText(
                                        text: "michaa",
                                        color: kBlack,
                                        size: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      TextUtil.secondaryText(
                                        text: "Amazing🤩",
                                        color: kBlack,
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Icon(
                                    baseModel.isFavourtie
                                        ? Icons.favorite
                                        : Icons.favorite_border_outlined,
                                    color:
                                        baseModel.isFavourtie ? kError : kBlack,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  TextUtil.secondaryText(
                                    text: "3d",
                                    color: kBlack,
                                    size: 10,
                                  ),
                                  SizedBox(
                                    width: screenUtil.setWidth(7),
                                  ),
                                  TextUtil.secondaryText(
                                    text: "0 Loves",
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
                  Divider(
                    color: kGrey,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
