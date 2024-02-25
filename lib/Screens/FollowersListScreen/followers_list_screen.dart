import 'package:barber_klipz_ui/Screens/FollowersListScreen/Backend/Provider/follower_list_base_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/net_image.dart';
import '../../Utils/text_util.dart';

class FollowersListScreen extends ConsumerStatefulWidget {
  final String userId;
  const FollowersListScreen({
    Key? key,
    required this.userId,
  }) : super(key: key);

  @override
  ConsumerState<FollowersListScreen> createState() =>
      _FollowersListScreenState();
}

class _FollowersListScreenState extends ConsumerState<FollowersListScreen> {
  @override
  void initState() {
    final baseModel = ref.read(followerListBaseModel);
    baseModel.getAllFollowerList(context, widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(followerListBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: "Followers",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
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
          itemCount: baseModel.followerList.length,
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
                            borderRadius: BorderRadius.circular(50),
                          ),
                          width: screenUtil.setHeight(40),
                          height: screenUtil.setHeight(40),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: NetImage(
                              uri: baseModel.followerList[index].profile_image,
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
                              text: baseModel.followerList[index].user_name,
                              color: kBlack,
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              height: screenUtil.setHeight(2),
                            ),
                            TextUtil.secondaryText(
                              text: baseModel.followerList[index].first_name ==
                                          null ||
                                      baseModel.followerList[index].last_name ==
                                          null
                                  ? ""
                                  : "${baseModel.followerList[index].first_name} ${baseModel.followerList[index].last_name}",
                              color: kTextSubTitle,
                              size: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                        const Spacer(),
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
