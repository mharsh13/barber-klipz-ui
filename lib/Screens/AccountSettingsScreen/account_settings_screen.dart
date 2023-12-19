import 'package:barber_klipz_ui/Screens/AccountSettingsScreen/Backend/Provider/account_settings_base_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Resources/image_const.dart';
import '../../Utils/net_image.dart';
import '../../Utils/text_util.dart';

class AccountSettingsScreen extends ConsumerWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseModel = ref.watch(accountSettingsBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: "Account Settings",
          color: kGold,
          size: 18,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenUtil.setWidth(8)),
            child: TextUtil.secondaryText(
              text: "Save",
              color: kWhite,
              size: 14,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(10),
                vertical: screenUtil.setHeight(14),
              ),
              child: Row(
                children: [
                  TextUtil.secondaryText(
                    text: "Edit Profile",
                    color: kBlack1,
                    size: 17,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  TextUtil.secondaryText(
                    text: "Change cover image",
                    color: kError,
                    size: 12,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(150),
              child: Stack(
                children: [
                  SizedBox(
                      width: screenUtil.screenWidth,
                      height: screenUtil.setHeight(120),
                      child: const NetImage(
                        uri:
                            "https://media.istockphoto.com/id/603164912/photo/suburb-asphalt-road-and-sun-flowers.jpg?s=612x612&w=0&k=20&c=qLoQ5QONJduHrQ0kJF3fvoofmGAFcrq6cL84HbzdLQM=",
                        fit: BoxFit.cover,
                      )),
                  Positioned(
                    bottom: 0.5,
                    left: 145,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      width: screenUtil.setHeight(80),
                      height: screenUtil.setHeight(80),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: const NetImage(
                          fit: BoxFit.cover,
                          uri:
                              "https://images.unsplash.com/photo-1618641986557-1ecd230959aa?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(7),
            ),
            TextUtil.secondaryText(
              text: "Change cover image",
              color: kError,
              size: 12,
            ),
            SizedBox(
              height: screenUtil.setHeight(12),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(18),
              ),
              child: Row(
                children: [
                  Container(
                    width: screenUtil.setWidth(85),
                    child: TextUtil.secondaryText(
                      text: "Username",
                      color: kTextSubTitle,
                      size: 14,
                    ),
                  ),
                  SizedBox(
                    width: screenUtil.setWidth(7),
                  ),
                  TextUtil.editProfileTextFormField(
                    screenUtil: screenUtil,
                    hintText: "Username",
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(12),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(18),
              ),
              child: Row(
                children: [
                  Container(
                    width: screenUtil.setWidth(85),
                    child: TextUtil.secondaryText(
                      text: "First name",
                      color: kTextSubTitle,
                      size: 14,
                    ),
                  ),
                  SizedBox(
                    width: screenUtil.setWidth(7),
                  ),
                  TextUtil.editProfileTextFormField(
                    screenUtil: screenUtil,
                    hintText: "Enter your name",
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(12),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(18),
              ),
              child: Row(
                children: [
                  Container(
                    width: screenUtil.setWidth(85),
                    child: TextUtil.secondaryText(
                      text: "Last name",
                      color: kTextSubTitle,
                      size: 14,
                    ),
                  ),
                  SizedBox(
                    width: screenUtil.setWidth(7),
                  ),
                  TextUtil.editProfileTextFormField(
                    screenUtil: screenUtil,
                    hintText: "Enter your surname",
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(12),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(18),
              ),
              child: Row(
                children: [
                  Container(
                    width: screenUtil.setWidth(85),
                    child: TextUtil.secondaryText(
                      text: "Website",
                      color: kTextSubTitle,
                      size: 14,
                    ),
                  ),
                  SizedBox(
                    width: screenUtil.setWidth(7),
                  ),
                  TextUtil.editProfileTextFormField(
                    screenUtil: screenUtil,
                    hintText: "Enter your website",
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(15),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(18),
              ),
              child: Row(
                children: [
                  Container(
                    width: screenUtil.setWidth(85),
                    child: TextUtil.secondaryText(
                      text: "Linktree",
                      color: kTextSubTitle,
                      size: 14,
                    ),
                  ),
                  SizedBox(
                    width: screenUtil.setWidth(7),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 12.0,
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                          )
                        ]),
                    child: Row(
                      children: [
                        Icon(Icons.list),
                        SizedBox(
                          width: screenUtil.setWidth(5),
                        ),
                        TextUtil.secondaryText(
                          text: "Add this to my linktree",
                          color: kBlack1,
                          size: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(12),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(18),
              ),
              child: Row(
                children: [
                  Container(
                    width: screenUtil.setWidth(85),
                    child: TextUtil.secondaryText(
                      text: "Bio",
                      color: kTextSubTitle,
                      size: 14,
                    ),
                  ),
                  SizedBox(
                    width: screenUtil.setWidth(7),
                  ),
                  TextUtil.editProfileTextFormField(
                    screenUtil: screenUtil,
                    hintText: "Write something about you",
                  )
                ],
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(12),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenUtil.setWidth(18),
              ),
              child: Row(
                children: [
                  Container(
                    width: screenUtil.setWidth(85),
                    child: TextUtil.secondaryText(
                      text: "Birthday",
                      color: kTextSubTitle,
                      size: 14,
                    ),
                  ),
                  SizedBox(
                    width: screenUtil.setWidth(7),
                  ),
                  TextUtil.editProfileTextFormField(
                    screenUtil: screenUtil,
                    hintText: "",
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
