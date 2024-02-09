import 'package:barber_klipz_ui/Screens/InboxScreen/Backend/Provider/inbox_base_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../Resources/color_const.dart';
import '../../../Utils/navigator_util.dart';
import '../../../Utils/net_image.dart';
import '../../../Utils/text_util.dart';
import '../../DirectMessageScreen/direct_message_screen.dart';

Widget allRequests(ScreenUtil screenUtil, InboxBaseModel inboxBaseModel) {
  return inboxBaseModel.loader
      ? const Center(
          child: CircularProgressIndicator(
            color: kYellow,
          ),
        )
      : Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              height: screenUtil.setHeight(40),
              decoration: BoxDecoration(
                color: kBackgroundDropDown,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextFormField(
                cursorColor: kBlack,
                textAlignVertical: TextAlignVertical.center,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.only(top: 13, bottom: 13, left: 10),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontSize: 16,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(10),
            ),
            ListView.builder(
              itemCount: inboxBaseModel.inboxList.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    NavigatorUtil.push(
                      context,
                      screen: DirectMessageScreen(
                        id: inboxBaseModel.inboxList[index].id,
                        profile_image:
                            inboxBaseModel.inboxList[index].profile_image ?? '',
                        user_name: inboxBaseModel.inboxList[index].user_name,
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: screenUtil.setWidth(10)),
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
                                  uri: inboxBaseModel
                                      .inboxList[index].profile_image,
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
                                  text:
                                      inboxBaseModel.inboxList[index].user_name,
                                  color: kBlack,
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    TextUtil.secondaryText(
                                      text: inboxBaseModel
                                          .inboxList[index].lastMessage.message,
                                      color: kTextSubTitle,
                                      size: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      width: screenUtil.setWidth(10),
                                    ),
                                    TextUtil.secondaryText(
                                      text: timeago.format(DateTime.parse(
                                        inboxBaseModel.inboxList[index]
                                            .lastMessage.createdAt,
                                      )),
                                      color: kTextSubTitle,
                                      size: 8,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: kTextSubTitle,
                                ))
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
        );
}
