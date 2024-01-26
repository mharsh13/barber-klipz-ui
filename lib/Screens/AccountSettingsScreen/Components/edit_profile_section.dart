import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/net_image.dart';
import '../../../Utils/text_util.dart';
import '../Backend/Provider/account_settings_base_model.dart';
import 'image_source.dart';

Column editProfile(
  ScreenUtil screenUtil,
  AccountSettingsBaseModel baseModel,
  BuildContext context,
) {
  return Column(
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
            GestureDetector(
              onTap: () {
                imageSource(
                  title: "Cover Image",
                  context: context,
                  screenUtil: screenUtil,
                  camera: baseModel.selectCoverCameraImage,
                  gallery: baseModel.selectCoverGalleryImage,
                );
              },
              child: TextUtil.secondaryText(
                text: "Change cover image",
                color: kError,
                size: 12,
              ),
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
              child: baseModel.coverPhoto != null
                  ? Image.file(
                      baseModel.coverPhoto!,
                      fit: BoxFit.cover,
                    )
                  : baseModel.coverImage == null
                      ? Container(
                          decoration:
                              BoxDecoration(border: Border.all(color: kBlack)),
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: screenUtil.setHeight(30)),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: TextUtil.secondaryText(
                                text: "Upload a cover photo",
                                color: kBlack,
                                size: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      : NetImage(
                          uri: baseModel.coverImage!,
                          fit: BoxFit.cover,
                        ),
            ),
            Positioned(
              bottom: 0.5,
              left: 145,
              child: Container(
                height: screenUtil.setHeight(75),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffA5A5A5),
                ),
                child: baseModel.profilePicture != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.file(baseModel.profilePicture!),
                      )
                    : baseModel.profileImage == null
                        ? CircleAvatar(
                            radius: screenUtil.setHeight(52),
                            backgroundColor: kBlack,
                            child: Icon(
                              Icons.camera_alt,
                              color: kWhite,
                              size: screenUtil.setSp(30),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: NetImage(
                              height: screenUtil.setHeight(75),
                              width: screenUtil.setHeight(75),
                              uri: baseModel.profileImage!,
                              fit: BoxFit.cover,
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
      GestureDetector(
        onTap: () {
          imageSource(
            title: "Profile Picture",
            context: context,
            screenUtil: screenUtil,
            camera: baseModel.selectCameraImage,
            gallery: baseModel.selectGalleryImage,
          );
        },
        child: TextUtil.secondaryText(
          text: "Change Profile Picture",
          color: kError,
          size: 12,
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
            SizedBox(
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
              controller: baseModel.username,
              enabled: false,
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
            SizedBox(
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
              controller: baseModel.firstName,
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
            SizedBox(
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
              controller: baseModel.lastName,
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
            SizedBox(
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
              controller: baseModel.website,
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
            SizedBox(
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
              controller: baseModel.bio,
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
            SizedBox(
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
            GestureDetector(
              onTap: () async {
                await baseModel.changeDate(context);
              },
              child: TextUtil.editProfileTextFormField(
                screenUtil: screenUtil,
                hintText: "Date of birth",
                controller: baseModel.newDate.text == ""
                    ? baseModel.selectedDate
                    : baseModel.newDate,
                enabled: false,
                icon: Icon(
                  Icons.calendar_month_rounded,
                  size: screenUtil.setSp(18),
                  color: kHintText,
                ),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: screenUtil.setHeight(20),
      ),
      const Divider(
        color: kGrey,
      )
    ],
  );
}
