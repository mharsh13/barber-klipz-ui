import 'package:barber_klipz_ui/Resources/color_const.dart';
import 'package:barber_klipz_ui/Screens/AddPostScreen/Backend/Provider/add_post_base_model.dart';
import 'package:barber_klipz_ui/Utils/net_image.dart';
import 'package:barber_klipz_ui/Utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddCaptionScreen extends ConsumerWidget {
  const AddCaptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseModel = ref.watch(addPostBaseModel);
    final screenUtil = baseModel.screenUtil;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenUtil.setWidth(8)),
            child: TextUtil.secondaryText(
              text: "Share",
              color: kBlack,
              size: 15,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
      body: Column(children: [
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
                child: const NetImage(
                    uri:
                        "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: screenUtil.screenWidth - screenUtil.setWidth(135),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: TextFormField(
                      key: key,
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
                            top: 13, bottom: 13, left: 10),
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
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: screenUtil.setWidth(8)),
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: kTextSubTitle)),
                        child: TextUtil.secondaryText(
                          text: "#Hashtags",
                          color: kBlack,
                          size: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: screenUtil.setWidth(8)),
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: kTextSubTitle)),
                        child: TextUtil.secondaryText(
                          text: "@Users",
                          color: kBlack,
                          size: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        const Divider(
          color: kTextSubTitle,
        ),
        Row(
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
                key: key,
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
                  contentPadding:
                      const EdgeInsets.only(top: 13, bottom: 13, left: 10),
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
        const Divider(
          color: kTextSubTitle,
        ),
      ]),
    );
  }
}
