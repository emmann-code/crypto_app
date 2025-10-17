import 'package:flutter/material.dart';
import 'package:roquu_app/core/app_exports.dart';
import 'package:roquu_app/core/utils/image_constant.dart';
import 'package:roquu_app/theme/theme_helper.dart';

import './custom_image_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
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
  }) : super(key: key);

  final String? title;

  final Color? titleColor;

  final Color? backgroundColor;

  final String? leadingIcon;

  final Color? leadingIconColor;

  final VoidCallback? onLeadingPressed;

  final bool? showLeading;

  final bool? centerTitle;

  final List<Widget>? actions;

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
