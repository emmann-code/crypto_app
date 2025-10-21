import 'package:flutter/material.dart';
import 'package:roquu_app/core/app_exports.dart';
import './custom_image_view.dart';

/// A customizable icon button component with background styling and flexible configuration.
///
/// This widget provides a reusable icon button with customizable background color,
/// border radius, padding, margin, and icon. It wraps Flutter's IconButton with
/// additional styling capabilities.
///
/// @param iconPath - Path to the icon image (SVG, PNG, etc.)
/// @param onPressed - Callback function when button is pressed
/// @param backgroundColor - Background color of the button
/// @param size - Overall size of the button (width and height)
/// @param borderRadius - Border radius for rounded corners
/// @param padding - Internal padding around the icon
/// @param margin - External margin around the button
/// @param iconSize - Size of the icon inside the button
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

  /// Path to the icon image
  final String? iconPath;

  /// Callback function triggered when button is pressed
  final VoidCallback? onPressed;

  /// Background color of the button
  final Color? backgroundColor;

  /// Overall size of the button (width and height)
  final double? size;

  /// Border radius for rounded corners
  final double? borderRadius;

  /// Internal padding around the icon
  final EdgeInsetsGeometry? padding;

  /// External margin around the button
  final EdgeInsetsGeometry? margin;

  /// Size of the icon inside the button
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
