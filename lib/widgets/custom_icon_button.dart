import 'package:flutter/material.dart';
import 'package:roquu_app/core/app_exports.dart';
import './custom_image_view.dart';














class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.iconPath,
    this.onPressed,
    this.backgroundColor,
    this.size,
    this.borderRadius,
    this.padding,
    this.margin,
    this.iconSize,
  });
  
  final String? iconPath;
  
  final VoidCallback? onPressed;
  
  final Color? backgroundColor;
  
  final double? size;
  
  final double? borderRadius;
  
  final EdgeInsetsGeometry? padding;
  
  final EdgeInsetsGeometry? margin;
  
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 32.h,
      height: size ?? 32.h,
      margin: margin ?? EdgeInsets.only(top: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor ?? Color(0xFF2A2F36),
        borderRadius: BorderRadius.circular(borderRadius ?? 16.h),
      ),
      child: IconButton(
        onPressed: onPressed,
        padding: padding ?? EdgeInsets.all(6.h),
        constraints: BoxConstraints(),
        icon: CustomImageView(
          imagePath: iconPath ?? ImageConstant.imgIcon,
          height: iconSize ?? 20.h,
          width: iconSize ?? 20.h,
        ),
      ),
    );
  }
}
