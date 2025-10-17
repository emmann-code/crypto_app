import 'package:flutter/material.dart';
import 'package:roquu_app/core/app_exports.dart';

/// A helper class for managing text styles in the application
class TextStyleHelper {
  static TextStyleHelper? _instance;

  TextStyleHelper._();

  static TextStyleHelper get instance {
    _instance ??= TextStyleHelper._();
    return _instance!;
  }

  TextStyle get title20RegularRoboto => TextStyle(
    fontSize: 20.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
  );

  TextStyle get title16BoldEncodeSans => TextStyle(
    fontSize: 16.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Encode Sans',
    color: appTheme.whiteCustom,
  );

  TextStyle get title16RegularInter => TextStyle(
    fontSize: 16.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );



  TextStyle get body14BoldEncodeSans => TextStyle(
    fontSize: 14.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Encode Sans',
    color: appTheme.green_A700,
  );

  TextStyle get body14BoldInter => TextStyle(
    fontSize: 14.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Inter',
    color: appTheme.whiteCustom,
  );

  TextStyle get body14RegularInter => TextStyle(
    fontSize: 14.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: appTheme.whiteCustom,
  );

  TextStyle get body12BoldEncodeSans => TextStyle(
    fontSize: 12.fSize,
    fontWeight: FontWeight.w700,
    fontFamily: 'Encode Sans',
    color: appTheme.whiteCustom,
  );

  TextStyle get body12RegularInter => TextStyle(
    fontSize: 12.fSize,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
    color: appTheme.blue_gray_200,
  );


  TextStyle get bodyTextInter => TextStyle(fontFamily: 'Inter');
}
