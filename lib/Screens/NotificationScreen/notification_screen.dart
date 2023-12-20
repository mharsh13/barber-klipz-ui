import 'package:barber_klipz_ui/Screens/NotificationScreen/Backend/Provider/notification_base_model.dart';
import 'package:barber_klipz_ui/Utils/net_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Resources/image_const.dart';
import '../../Utils/text_util.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseModel = ref.watch(notificationBaseModel);
    final screenUtil = baseModel.screenUtil;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
            text: "Barber Klipz",
            color: kGold,
            size: 18,
            fontWeight: FontWeight.w600),
        centerTitle: true,
        leading: Row(
          children: [
            SizedBox(
              width: screenUtil.setWidth(5),
            ),
            Flexible(
              child: IconButton(
                icon: const Icon(
                  Icons.movie_creation_outlined,
                  color: kWhite,
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: screenUtil.setWidth(45),
            ),
            Flexible(
              child: IconButton(
                icon: const Icon(
                  Icons.chat_outlined,
                  color: kWhite,
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
        actions: [
          Flexible(
            child: IconButton(
              icon: const Icon(
                Icons.cut_outlined,
                color: kWhite,
              ),
              onPressed: () {},
            ),
          ),
          Flexible(
            child: IconButton(
              icon: const Icon(Icons.email_outlined),
              color: kWhite,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenUtil.setWidth(10)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: screenUtil.setHeight(10),
            ),
            TextUtil.secondaryText(
              text: "This week",
              color: kBlack,
              size: 15,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: screenUtil.setHeight(15),
            ),
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          width: screenUtil.setHeight(40),
                          height: screenUtil.setHeight(40),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: NetImage(
                                fit: BoxFit.cover,
                                uri:
                                    "https://miro.medium.com/v2/resize:fit:1400/1*YMJDp-kqus7i-ktWtksNjg.jpeg",
                              )),
                        ),
                        SizedBox(
                          width: screenUtil.setWidth(8),
                        ),
                        TextUtil.secondaryText(
                          text: "mharsh13 is now following you!",
                          color: kTextTitle,
                          size: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        const Spacer(),
                        TextUtil.secondaryText(
                          text: "3d",
                          color: kTextSubTitle,
                          size: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenUtil.setHeight(2),
                    ),
                    const Divider(
                      color: kGrey,
                    )
                  ],
                );
              },
            )
          ]),
        ),
      ),
    ));
  }
}
