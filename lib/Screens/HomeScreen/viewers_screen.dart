import 'package:barber_klipz_ui/Screens/HomeScreen/Backend/Provider/home_screen_base_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/net_image.dart';
import '../../Utils/text_util.dart';

class ViewersScreen extends ConsumerWidget {
  const ViewersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseModel = ref.watch(homeScreenBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: "Viewers",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        leading: const BackButton(
          color: kWhite,
        ),
      ),
      body: ListView.builder(
        itemCount: 15,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: screenUtil.setWidth(10)),
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
                          child: const NetImage(
                            uri:
                                "https://www.google.com/imgres?imgurl=https%3A%2F%2Fimages.ctfassets.net%2Fhrltx12pl8hq%2F28ECAQiPJZ78hxatLTa7Ts%2F2f695d869736ae3b0de3e56ceaca3958%2Ffree-nature-images.jpg%3Ffit%3Dfill%26w%3D1200%26h%3D630&tbnid=0E5dDA82VanW3M&vet=12ahUKEwiew8Oc1s6EAxV3nWMGHS3iAS0QMygKegQIARBg..i&imgrefurl=https%3A%2F%2Fwww.shutterstock.com%2Fdiscover%2Ffree-nature-images&docid=uEeA4F2Pf5UbvM&w=1200&h=630&q=image&ved=2ahUKEwiew8Oc1s6EAxV3nWMGHS3iAS0QMygKegQIARBg",
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
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenUtil.setHeight(5),
                ),
                const Divider(
                  color: kTextSubTitle,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
