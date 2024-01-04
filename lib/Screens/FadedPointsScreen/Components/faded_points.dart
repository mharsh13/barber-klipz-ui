import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Resources/color_const.dart';
import '../../../Utils/text_util.dart';

Padding fadedPoints(ScreenUtil screenUtil) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: screenUtil.setHeight(20),
      horizontal: screenUtil.setWidth(15),
    ),
    child: Column(
      children: [
        TextUtil.secondaryText(
          text: 'Faded Point Packs',
          color: kBlack,
          size: 16.5,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: screenUtil.setHeight(12),
        ),
        TextUtil.secondaryText(
          text:
              'Support your favourite content creator by loving their\nposts!',
          color: kTextSubTitle,
          size: 11,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screenUtil.setHeight(15),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenUtil.setWidth(13),
              vertical: screenUtil.setHeight(15)),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 4),
                blurRadius: 12.0,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(
                Icons.cut_outlined,
                color: kGold,
              ),
              SizedBox(
                width: screenUtil.setWidth(7),
              ),
              TextUtil.secondaryText(
                text: '100 Faded Points',
                color: kBlack,
                size: 13.5,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              TextUtil.secondaryText(
                text: '\$85.00',
                color: kBlack,
                size: 13,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenUtil.setHeight(15),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenUtil.setWidth(13),
              vertical: screenUtil.setHeight(15)),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 4),
                blurRadius: 12.0,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(
                Icons.cut_outlined,
                color: kGold,
              ),
              SizedBox(
                width: screenUtil.setWidth(7),
              ),
              TextUtil.secondaryText(
                text: '500 Faded Points',
                color: kBlack,
                size: 13.5,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              TextUtil.secondaryText(
                text: '\$430.00',
                color: kBlack,
                size: 13,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenUtil.setHeight(15),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenUtil.setWidth(13),
              vertical: screenUtil.setHeight(15)),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 4),
                blurRadius: 12.0,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(
                Icons.cut_outlined,
                color: kGold,
              ),
              SizedBox(
                width: screenUtil.setWidth(7),
              ),
              TextUtil.secondaryText(
                text: '1000 Faded Points',
                color: kBlack,
                size: 13.5,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              TextUtil.secondaryText(
                text: '\$850.00',
                color: kBlack,
                size: 13,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenUtil.setHeight(15),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenUtil.setWidth(13),
              vertical: screenUtil.setHeight(15)),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 4),
                blurRadius: 12.0,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(
                Icons.cut_outlined,
                color: kGold,
              ),
              SizedBox(
                width: screenUtil.setWidth(7),
              ),
              TextUtil.secondaryText(
                text: '2500 Faded Points',
                color: kBlack,
                size: 13.5,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              TextUtil.secondaryText(
                text: '\$2,150.00',
                color: kBlack,
                size: 13,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenUtil.setHeight(15),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenUtil.setWidth(13),
              vertical: screenUtil.setHeight(15)),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 4),
                blurRadius: 12.0,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(
                Icons.cut_outlined,
                color: kGold,
              ),
              SizedBox(
                width: screenUtil.setWidth(7),
              ),
              TextUtil.secondaryText(
                text: '10000 Faded Points',
                color: kBlack,
                size: 13.5,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              TextUtil.secondaryText(
                text: '\$8,100.00',
                color: kBlack,
                size: 13,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenUtil.setHeight(15),
        ),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenUtil.setWidth(13),
              vertical: screenUtil.setHeight(15)),
          decoration: BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                offset: Offset(2, 4),
                blurRadius: 12.0,
                color: Color.fromRGBO(0, 0, 0, 0.16),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(
                Icons.cut_outlined,
                color: kGold,
              ),
              SizedBox(
                width: screenUtil.setWidth(7),
              ),
              TextUtil.secondaryText(
                text: '25000 Faded Points',
                color: kBlack,
                size: 13.5,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              TextUtil.secondaryText(
                text: '\$19,900.00',
                color: kBlack,
                size: 13,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
