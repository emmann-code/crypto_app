import 'package:flutter/material.dart';
import 'package:roquu_app/core/app_exports.dart';

















class CustomCopyButton extends StatelessWidget {
  const CustomCopyButton({
    super.key,
    this.text,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.fontSize,
    this.fontWeight,
    this.horizontalPadding,
    this.verticalPadding,
    this.width,
    this.height,
  });
  final String? text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 29.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Color(0xFF1C2127),
          foregroundColor: textColor ?? Color(0xFFA7B1BC),
          side: BorderSide(color: borderColor ?? Color(0xFF262932), width: 1.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.h),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 22.h,
            vertical: verticalPadding ?? 6.h,
          ),
          elevation: 0,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          text ?? "Copy",
          style: TextStyleHelper.instance.bodyTextInter.copyWith(
            color: textColor ?? Color(0xFFA7B1BC),
            height: 1.21,
          ),
        ),
      ),
    );
  }
}
