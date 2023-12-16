import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/net_image.dart';
import '../../../Utils/text_util.dart';

Column allRequests(ScreenUtil screenUtil) {
  return Column(
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
            contentPadding: EdgeInsets.only(top: 13, bottom: 13, left: 10),
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
        itemCount: 12,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: screenUtil.setWidth(10)),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      width: screenUtil.setHeight(40),
                      height: screenUtil.setHeight(40),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: const NetImage(
                          uri:
                              "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
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
                          text: "mharsh13",
                          color: kBlack,
                          size: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: screenUtil.setHeight(2),
                        ),
                        Row(
                          children: [
                            TextUtil.secondaryText(
                              text: "Helloooooo",
                              color: kTextSubTitle,
                              size: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(
                              width: screenUtil.setWidth(5),
                            ),
                            TextUtil.secondaryText(
                              text: "1w",
                              color: kTextSubTitle,
                              size: 12,
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
          );
        },
      )
    ],
  );
}
