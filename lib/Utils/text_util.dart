import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Resources/color_const.dart';

class TextUtil {
  static Widget primaryText({
    required String text,
    required Color color,
    required double size,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    double? lineHeight,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: color,
        height: lineHeight,
        fontSize: ScreenUtil().setSp(size),
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        decoration: decoration ?? TextDecoration.none,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }

  static Widget secondaryText({
    required String text,
    required Color color,
    required double size,
    TextAlign? textAlign,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    double? lineHeight,
    int? maxLines,
    bool? softWrap,
    TextOverflow? overflow,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        color: color,
        height: lineHeight,
        fontSize: ScreenUtil().setHeight(size),
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
        decoration: decoration ?? TextDecoration.none,
      ),
      overflow: overflow ?? TextOverflow.clip,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }

  static TextStyle textStyle({
    required Color color,
    required double fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    double? lineHeight,
  }) {
    return TextStyle(
      fontFamily: 'Montserrat',
      color: color,
      height: lineHeight,
      fontSize: ScreenUtil().setSp(fontSize),
      fontStyle: fontStyle ?? FontStyle.normal,
      fontWeight: fontWeight ?? FontWeight.normal,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  static Widget customTextFormField({
    required ScreenUtil screenUtil,
    required TextInputType inputType,
    required String hintText,
    TextEditingController? textEditingController,
    String? Function(String?)? validator,
    Color? cursorColor,
    InputDecoration? decoration,
    TextStyle? style,
    FocusNode? focusNode,
    List<TextInputFormatter>? inputFormatters,
    GlobalKey<FormFieldState>? key,
    BuildContext? context,
    FocusNode? nextNode,
    EdgeInsets? scrollPadding,
    TextInputAction? textInputAction,
  }) {
    return Container(
      width: screenUtil.setWidth(300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
      ),
      child: TextFormField(
        key: key,
        scrollPadding: scrollPadding ?? EdgeInsets.zero,
        validator: validator,
        controller: textEditingController,
        cursorColor: kPrimary,
        keyboardType: inputType,
        inputFormatters: inputFormatters ?? [],
        textInputAction: textInputAction,
        style: TextUtil.textStyle(
          color: kBlack,
          fontSize: screenUtil.setSp(15),
          fontWeight: FontWeight.w500,
        ),
        focusNode: focusNode,
        onFieldSubmitted: (term) {
          if (focusNode != null) {
            focusNode.unfocus();
          }
          if (nextNode != null) {
            FocusScope.of(context!).requestFocus(nextNode);
          }
        },
        decoration: InputDecoration(
          constraints: BoxConstraints(
            minHeight: screenUtil.setHeight(38),
          ),
          filled: true,
          fillColor: kBackgroundGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide.none,
          ),
          isDense: true,
          errorStyle: const TextStyle(color: Colors.amberAccent),
          contentPadding: const EdgeInsets.only(top: 13, bottom: 13, left: 10),
          hintText: hintText,
          hintStyle: TextUtil.textStyle(
            color: kHintText,
            fontSize: screenUtil.setHeight(12),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  static Widget customBrandSignUpTextFormField({
    required ScreenUtil screenUtil,
    required TextInputType inputType,
    required String hintText,
    TextEditingController? textEditingController,
    String? Function(String?)? validator,
    Color? cursorColor,
    InputDecoration? decoration,
    TextStyle? style,
    FocusNode? focusNode,
    List<TextInputFormatter>? inputFormatters,
    GlobalKey<FormFieldState>? key,
    BuildContext? context,
    FocusNode? nextNode,
    EdgeInsets? scrollPadding,
    TextInputAction? textInputAction,
  }) {
    return Container(
      width: screenUtil.setWidth(290),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
      ),
      // alignment: Alignment.centerLeft,
      child: TextFormField(
        key: key,
        scrollPadding: scrollPadding ?? EdgeInsets.zero,
        validator: validator,
        controller: textEditingController,
        cursorColor: kPrimary,
        keyboardType: inputType,
        inputFormatters: inputFormatters ?? [],
        textInputAction: textInputAction,
        style: TextUtil.textStyle(
          color: kTextBody,
          fontSize: screenUtil.setSp(15),
          fontWeight: FontWeight.w500,
        ),
        focusNode: focusNode,
        // textInputAction: TextInputAction.next,
        onFieldSubmitted: (term) {
          if (focusNode != null) {
            focusNode.unfocus();
          }
          if (nextNode != null) {
            FocusScope.of(context!).requestFocus(nextNode);
          }
        },
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
          errorStyle: const TextStyle(color: Colors.amberAccent),
          contentPadding: const EdgeInsets.only(top: 13, bottom: 13, left: 10),
          // border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextUtil.textStyle(
            color: kHintText,
            fontSize: screenUtil.setHeight(12),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  static Widget campaignTextFormField({
    required ScreenUtil screenUtil,
    required TextInputType inputType,
    required String hintText,
    TextEditingController? textEditingController,
    Color? cursorColor,
    TextStyle? style,
    FocusNode? focusNode,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? Function(String?)? validator,
    GlobalKey<FormFieldState>? key,
    BuildContext? context,
    FocusNode? nextNode,
    Function(String)? onChanged,
  }) {
    return Container(
      width: screenUtil.setWidth(290),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
      ),
      alignment: Alignment.centerLeft,
      child: TextFormField(
        key: key,
        validator: validator,
        onChanged: onChanged,
        controller: textEditingController,
        cursorColor: kPrimary,
        keyboardType: inputType,
        style: TextUtil.textStyle(
          color: kTextBody,
          fontSize: screenUtil.setHeight(12),
          fontWeight: FontWeight.w500,
        ),
        focusNode: focusNode,
        onFieldSubmitted: (term) {
          focusNode!.unfocus();
          FocusScope.of(context!).requestFocus(nextNode);
        },
        decoration: InputDecoration(
          focusColor: kPrimary,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(
              color: kPrimary,
              width: 1.2,
            ),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          suffixIconConstraints: const BoxConstraints(
            minHeight: 0,
            minWidth: 0,
          ),
          isDense: true,
          filled: true,
          fillColor: kBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: BorderSide(
              color: kTextSubTitle.withOpacity(0.7),
              width: 1.2,
            ),
          ),
          contentPadding:
              const EdgeInsets.only(top: 9, bottom: 9, left: 10, right: 8),
          hintText: hintText,
          hintStyle: TextUtil.textStyle(
            color: kHintText,
            fontSize: screenUtil.setHeight(13),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  static Widget editProfileTextFormField({
    required ScreenUtil screenUtil,
    Color? cursorColor,
    InputDecoration? decoration,
    TextStyle? style,
    FocusNode? focusNode,
    Icon? icon,
    TextEditingController? controller,
    String? Function(String?)? validator,
    GlobalKey<FormFieldState>? key,
    bool? enabled,
    bool? readOnly,
    TextInputType? keyBoardType,
    Widget? suffix,
  }) {
    return Container(
      width: screenUtil.setWidth(200),
      alignment: Alignment.centerLeft,
      child: TextFormField(
        readOnly: readOnly ?? false,
        key: key,
        validator: validator,
        cursorColor: kBlack,
        controller: controller,
        keyboardType: keyBoardType ?? TextInputType.name,
        enabled: enabled ?? true,
        style: TextUtil.textStyle(
          color: kBlack,
          fontSize: screenUtil.setHeight(11),
        ),
        focusNode: focusNode,
        decoration: InputDecoration(
          suffixIcon: icon,
          suffix: suffix,
          suffixIconConstraints: const BoxConstraints(
            minHeight: 0,
            minWidth: 0,
          ),
          isDense: true,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: kTextSubTitle,
            ),
          ),
          errorStyle: const TextStyle(color: kError),
          contentPadding: const EdgeInsets.only(
            top: 4,
            bottom: 5,
            left: 4,
          ),
        ),
      ),
    );
  }
}
