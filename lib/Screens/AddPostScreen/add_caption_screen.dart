import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Screens/AddPostScreen/Backend/Provider/add_post_base_model.dart';
import 'package:barber_klipz_ui/Screens/ProfileScreen/Backend/Provider/profile_base_model.dart';
import 'package:barber_klipz_ui/Utils/text_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddCaptionScreen extends ConsumerStatefulWidget {
  const AddCaptionScreen({super.key});

  @override
  ConsumerState<AddCaptionScreen> createState() => _AddCaptionScreenState();
}

class _AddCaptionScreenState extends ConsumerState<AddCaptionScreen> {
  @override
  Widget build(BuildContext context) {
    final baseModel = ref.watch(addPostBaseModel);
    final userProfileBaseModel = ref.watch(profileBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlack2,
        leading: const BackButton(
          color: kWhite,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              baseModel.createImagePost(
                context,
                userProfileBaseModel,
              );
            },
            child: Padding(
              padding: EdgeInsets.only(right: screenUtil.setWidth(8)),
              child: TextUtil.secondaryText(
                text: "Share",
                color: kWhite,
                size: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenUtil.setHeight(120),
              width: screenUtil.screenWidth,
              decoration: const BoxDecoration(color: kBackgroundCard),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: screenUtil.setWidth(135),
                    child: Image.file(
                      baseModel.selectedImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: screenUtil.setHeight(57),
                        width:
                            screenUtil.screenWidth - screenUtil.setWidth(135),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: TextFormField(
                          scrollPadding: EdgeInsets.zero,
                          controller: baseModel.caption,
                          cursorColor: kBlack,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: TextUtil.textStyle(
                            color: kBlack,
                            fontSize: screenUtil.setSp(15),
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            constraints: BoxConstraints(
                              minHeight: screenUtil.setHeight(38),
                            ),
                            filled: true,
                            fillColor: kBackground,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7),
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.only(
                              top: 13,
                              bottom: 13,
                              left: 10,
                            ),
                            hintText: "Please enter caption here.",
                            hintStyle: TextUtil.textStyle(
                              color: kHintText,
                              fontSize: screenUtil.setHeight(12),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(40),
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       margin: EdgeInsets.symmetric(
                      //           horizontal: screenUtil.setWidth(8)),
                      //       padding: const EdgeInsets.all(2),
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5),
                      //           border: Border.all(color: kTextSubTitle)),
                      //       child: TextUtil.secondaryText(
                      //         text: "#Hashtags",
                      //         color: kBlack,
                      //         size: 12,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //     Container(
                      //       margin: EdgeInsets.symmetric(
                      //           horizontal: screenUtil.setWidth(8)),
                      //       padding: const EdgeInsets.all(2),
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5),
                      //           border: Border.all(color: kTextSubTitle)),
                      //       child: TextUtil.secondaryText(
                      //         text: "@Users",
                      //         color: kBlack,
                      //         size: 12,
                      //         fontWeight: FontWeight.w500,
                      //       ),
                      //     ),
                      //   ],
                      // )
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              color: kTextSubTitle,
            ),
            GestureDetector(
              onTap: () {
                baseModel.getCurrentPosition(context);
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: screenUtil.setWidth(5)),
                    child: const Icon(
                      Icons.location_on_outlined,
                      size: 32,
                    ),
                  ),
                  SizedBox(
                    width: screenUtil.setWidth(10),
                  ),
                  Container(
                    width: screenUtil.screenWidth - screenUtil.setSp(47),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextFormField(
                      scrollPadding: EdgeInsets.zero,
                      cursorColor: kBlack,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: TextUtil.textStyle(
                        color: kBlack,
                        fontSize: screenUtil.setSp(15),
                        fontWeight: FontWeight.w400,
                      ),
                      enabled: false,
                      controller: baseModel.locationController,
                      decoration: InputDecoration(
                        constraints: BoxConstraints(
                          minHeight: screenUtil.setHeight(38),
                        ),
                        filled: true,
                        fillColor: kBackground,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(7),
                          borderSide: BorderSide.none,
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.only(
                            top: 13, bottom: 13, left: 10),
                        hintText: "Add location",
                        hintStyle: TextUtil.textStyle(
                          color: kHintText,
                          fontSize: screenUtil.setHeight(12),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: kTextSubTitle,
            ),
            // Row(
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.only(left: screenUtil.setWidth(5)),
            //       child: const Icon(
            //         Icons.stars,
            //         size: 32,
            //       ),
            //     ),
            //     SizedBox(
            //       width: screenUtil.setWidth(10),
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         TextUtil.secondaryText(
            //           text: "Exclusive Content:",
            //           color: kBlack,
            //           size: 12,
            //         ),
            //         SizedBox(
            //           height: screenUtil.setHeight(7),
            //         ),
            //         baseModel.exclusiveContent == true
            //             ? Container(
            //                 padding: const EdgeInsets.all(3),
            //                 color: kGreen,
            //                 child: TextUtil.secondaryText(
            //                   text: "Sharing to Subscribers only",
            //                   color: kBlack,
            //                   size: 12,
            //                 ),
            //               )
            //             : Container(
            //                 padding: const EdgeInsets.all(3),
            //                 color: kCategoryText.withOpacity(0.7),
            //                 child: TextUtil.secondaryText(
            //                   text: "Public Sharing",
            //                   color: kBlack,
            //                   size: 12,
            //                 ),
            //               ),
            //       ],
            //     ),
            //     const Spacer(),
            //     Padding(
            //       padding: EdgeInsets.only(
            //         right: screenUtil.setWidth(5),
            //       ),
            //       child: SizedBox(
            //         width: 55,
            //         height: 35,
            //         child: FittedBox(
            //           fit: BoxFit.fill,
            //           child: CupertinoSwitch(
            //             value: baseModel.exclusiveContent,
            //             activeColor: kGreen,
            //             trackColor: kGrey,
            //             thumbColor: kWhite,
            //             onChanged: (value) {
            //               baseModel.enableExclusiveContent(value);
            //             },
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // const Divider(
            //   color: kTextSubTitle,
            // ),
            // baseModel.exclusiveContent == true
            //     ? Row(
            //         children: [
            //           Padding(
            //             padding: EdgeInsets.only(left: screenUtil.setWidth(5)),
            //             child: const Icon(
            //               Icons.content_paste_rounded,
            //               size: 30,
            //             ),
            //           ),
            //           SizedBox(
            //             width: screenUtil.setWidth(10),
            //           ),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               TextUtil.secondaryText(
            //                 text: "Exclusive Content Agreement:",
            //                 color: kBlack,
            //                 size: 12,
            //               ),
            //               SizedBox(
            //                 height: screenUtil.setHeight(5),
            //               ),
            //               TextUtil.secondaryText(
            //                 text:
            //                     "In order to post premium content you\nmust assure that you own the material.\nAny infringement of content ownership\nwill be flagged.",
            //                 color: kBlack,
            //                 size: 11,
            //               ),
            //             ],
            //           ),
            //           const Spacer(),
            //           Padding(
            //             padding: EdgeInsets.only(
            //               right: screenUtil.setWidth(5),
            //             ),
            //             child: SizedBox(
            //               width: 55,
            //               height: 35,
            //               child: FittedBox(
            //                 fit: BoxFit.fill,
            //                 child: CupertinoSwitch(
            //                   value: baseModel.exclusiveContentAgreement,
            //                   activeColor: kGreen,
            //                   trackColor: kGrey,
            //                   thumbColor: kWhite,
            //                   onChanged: (value) {
            //                     baseModel
            //                         .enableExclusiveContentAgreement(value);
            //                   },
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       )
            //     : Container(),
            // baseModel.exclusiveContent == true
            //     ? const Divider(
            //         color: kTextSubTitle,
            //       )
            //     : Container(),
          ],
        ),
      ),
    );
  }
}
