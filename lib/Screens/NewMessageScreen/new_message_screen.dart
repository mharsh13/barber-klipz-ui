import 'package:barber_klipz_ui/Screens/DirectMessageScreen/direct_message_screen.dart';
import 'package:barber_klipz_ui/Screens/NewMessageScreen/Backend/Provider/new_message_base_model.dart';
import 'package:barber_klipz_ui/Utils/navigator_util.dart';
import 'package:barber_klipz_ui/Utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/net_image.dart';

class NewMessageScreen extends ConsumerStatefulWidget {
  const NewMessageScreen({super.key});

  @override
  ConsumerState<NewMessageScreen> createState() => _NewMessageScreenState();
}

class _NewMessageScreenState extends ConsumerState<NewMessageScreen> {
  @override
  void initState() {
    final baseModel = ref.read(newMessageBaseModel);
    baseModel.getAllUsers(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(newMessageBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        leading: const BackButton(
          color: kWhite,
        ),
        title: TextUtil.secondaryText(
          text: "New Message",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(right: screenUtil.setWidth(10)),
        //     child: TextUtil.secondaryText(
        //       text: "Chat",
        //       color: kWhite,
        //       size: 15,
        //       fontWeight: FontWeight.w500,
        //     ),
        //   )
        // ],
      ),
      body: baseModel.loader
          ? const Center(
              child: CircularProgressIndicator(
                color: kYellow,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenUtil.setHeight(10),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: screenUtil.setWidth(10)),
                    child: Row(
                      children: [
                        TextUtil.secondaryText(
                          text: "To",
                          color: kBlack,
                          size: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          width: screenUtil.setWidth(10),
                        ),
                        TextUtil.customTextFormField(
                          screenUtil: screenUtil,
                          inputType: TextInputType.text,
                          hintText: "Search",
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(18),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenUtil.setWidth(10)),
                    child: TextUtil.secondaryText(
                      text: "Suggestions",
                      color: kBlack1,
                      size: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: screenUtil.setHeight(15),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: baseModel.users.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          NavigatorUtil.push(
                            context,
                            screen: DirectMessageScreen(
                              id: baseModel.users[index].id,
                              profile_image:
                                  baseModel.users[index].profile_image ?? '',
                              user_name: baseModel.users[index].user_name,
                            ),
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: screenUtil.setWidth(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    width: screenUtil.setHeight(40),
                                    height: screenUtil.setHeight(40),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: NetImage(
                                        uri: baseModel
                                            .users[index].profile_image,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenUtil.setWidth(8),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
    );
  }
}
