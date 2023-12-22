import 'package:barber_klipz_ui/Utils/button_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../Resources/color_const.dart';
import '../../Utils/text_util.dart';
import 'Backend/Provider/change_username_base_model.dart';

class ChangeUsernameScreen extends ConsumerWidget {
  const ChangeUsernameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseModel = ref.watch(changeUsernameBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        title: TextUtil.secondaryText(
          text: "Change Username",
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
            horizontal: screenUtil.setWidth(20),
            vertical: screenUtil.setHeight(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: screenUtil.setWidth(320),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                key: key,
                cursorColor: kBlack,
                keyboardType: TextInputType.text,
                style: TextUtil.textStyle(
                  color: kBlack,
                  fontSize: screenUtil.setHeight(11),
                ),
                decoration: InputDecoration(
                  hintText: "New Username",
                  hintStyle: TextUtil.textStyle(
                    color: kHintText,
                    fontSize: screenUtil.setHeight(12),
                    fontWeight: FontWeight.w400,
                  ),
                  isDense: true,
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kTextSubTitle,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.only(top: 8, bottom: 5, left: 10),
                  errorStyle: const TextStyle(color: kError),
                ),
              ),
            ),
            SizedBox(
              height: screenUtil.setHeight(15),
            ),
            Container(
              width: screenUtil.setWidth(320),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                key: key,
                cursorColor: kBlack,
                keyboardType: TextInputType.text,
                style: TextUtil.textStyle(
                  color: kBlack,
                  fontSize: screenUtil.setHeight(11),
                ),
                decoration: InputDecoration(
                  hintText: "Account Password",
                  hintStyle: TextUtil.textStyle(
                    color: kHintText,
                    fontSize: screenUtil.setHeight(12),
                    fontWeight: FontWeight.w400,
                  ),
                  isDense: true,
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kTextSubTitle,
                    ),
                  ),
                  contentPadding:
                      const EdgeInsets.only(top: 8, bottom: 5, left: 10),
                  errorStyle: const TextStyle(color: kError),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ButtonUtil.primaryButton(
                    text: "Change", onPressed: () {}, screenUtil: screenUtil),
              ),
            )
          ],
        ),
      ),
    );
  }
}
