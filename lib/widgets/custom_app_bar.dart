import 'package:flutter/material.dart';
import 'package:roquu_app/core/app_exports.dart';

import './custom_image_view.dart';

/// CustomAppBar - A reusable app bar component with customizable title, leading icon, and styling
///
/// @param title - The title text to display in the app bar
/// @param titleColor - Color of the title text
/// @param backgroundColor - Background color of the app bar
/// @param leadingIcon - Path to the leading icon (back arrow)
/// @param leadingIconColor - Color of the leading icon
/// @param onLeadingPressed - Callback function when leading icon is pressed
/// @param showLeading - Whether to show the leading icon
/// @param centerTitle - Whether to center the title
/// @param actions - List of action widgets to display on the right
/// @param elevation - Elevation of the app bar
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.titleColor,
    this.backgroundColor,
    this.leadingIcon,
    this.leadingIconColor,
    this.onLeadingPressed,
    this.showLeading,
    this.centerTitle,
    this.actions,
    this.elevation,
  });

  /// The title text to display in the app bar
  final String? title;

  /// Color of the title text
  final Color? titleColor;

  /// Background color of the app bar
  final Color? backgroundColor;

  /// Path to the leading icon (back arrow)
  final String? leadingIcon;

  /// Color of the leading icon
  final Color? leadingIconColor;

  /// Callback function when leading icon is pressed
  final VoidCallback? onLeadingPressed;

  /// Whether to show the leading icon
  final bool? showLeading;

  /// Whether to center the title
  final bool? centerTitle;

  /// List of action widgets to display on the right
  final List<Widget>? actions;

  /// Elevation of the app bar
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Color(0xFF1C2127),
      elevation: elevation ?? 0,
      centerTitle: centerTitle ?? false,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leading: (showLeading ?? true)
          ? IconButton(
              onPressed: onLeadingPressed ?? () => Navigator.pop(context),
              icon: CustomImageView(
                imagePath: leadingIcon ?? ImageConstant.imgArrow,
                height: 20.h,
                width: 12.h,
                color: leadingIconColor ?? appTheme.whiteCustom,
              ),
              padding: EdgeInsets.all(16.h),
            )
          : null,
      title: title != null
          ? Text(
              title!,
              style: TextStyleHelper.instance.title16RegularInter.copyWith(
                color: titleColor ?? appTheme.whiteCustom,
                height: 1.25,
              ),
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64.h);
}
