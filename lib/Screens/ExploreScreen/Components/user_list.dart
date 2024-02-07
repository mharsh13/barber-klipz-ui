import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/net_image.dart';
import '../../../Utils/text_util.dart';
import '../Backend/Provider/explore_screen_base_model.dart';

class UserList extends ConsumerStatefulWidget {
  const UserList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserListState();
}

class _UserListState extends ConsumerState<UserList> {
  @override
  void initState() {
    final baseModel = ref.read(exploreScreenBaseModel);
    baseModel.getAllUsers(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(exploreScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Container(
      margin: EdgeInsets.only(top: screenUtil.setHeight(20)),
      child: baseModel.loader
          ? const Center(
              child: CircularProgressIndicator(
                color: kYellow,
              ),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: baseModel.users.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
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
                              child: NetImage(
                                uri: baseModel.users[index].profile_image,
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
                                text: baseModel.users[index].user_name,
                                color: kBlack,
                                size: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: screenUtil.setHeight(2),
                              ),
                              TextUtil.secondaryText(
                                text:
                                    "${baseModel.users[index].first_name ?? ''} ${baseModel.users[index].last_name ?? ''}",
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
    );
  }
}
