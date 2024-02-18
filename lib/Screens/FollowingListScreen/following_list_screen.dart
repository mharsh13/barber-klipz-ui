import 'package:barber_klipz_ui/Screens/FollowingListScreen/Backend/Provider/following_list_base_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/net_image.dart';
import '../../Utils/text_util.dart';

class FollowingListScreen extends ConsumerWidget {
  const FollowingListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseModel = ref.watch(followingListBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: "Following",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_box_outlined,
              color: kWhite,
            ),
            onPressed: () {},
          )
        ],
        leading: const BackButton(
          color: kWhite,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenUtil.setHeight(10),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 15,
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenUtil.setWidth(10),
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
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS75ebrwvgVW5Ks_oLfCbG8Httf3_9g-Ynl_Q&usqp=CAU",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenUtil.setWidth(8),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextUtil.secondaryText(
                              text: "George",
                              color: kBlack,
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: screenUtil.setHeight(2),
                            ),
                            TextUtil.secondaryText(
                              text: "George",
                              color: kTextSubTitle,
                              size: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const Spacer(),
                        // Checkbox(
                        //   checkColor: Colors.white,
                        //   value: baseModel.isChecked,
                        //   shape: const CircleBorder(),
                        //   onChanged: (bool? value) {
                        //     baseModel.checkUser(value);
                        //   },
                        // )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenUtil.setHeight(2),
                ),
                const Divider(
                  color: kTextSubTitle,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}