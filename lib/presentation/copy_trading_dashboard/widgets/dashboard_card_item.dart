import 'package:flutter/material.dart';
import 'package:roquu_app/core/app_exports.dart';
import 'package:roquu_app/core/utils/image_constant.dart';
import 'package:roquu_app/theme/text_style_helper.dart';
import 'package:roquu_app/theme/theme_helper.dart';
import '../../../widgets/custom_icon_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/dashboard_card_item_model.dart';

class DashboardCardItem extends StatelessWidget {
  final DashboardCardItemModel? model;
  final VoidCallback? onTap;

  DashboardCardItem({Key? key, this.model, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170.h,
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.h),
          gradient: LinearGradient(
            begin: Alignment(0.134, -1.0),
            end: Alignment(0.134, 1.0),
            colors: model?.title == "My dashboard"
                ? [Color(0xFFABE2F3), appTheme.teal_100, Color(0xFFEBE9D0)]
                : [Color(0xFFC0CFFE), appTheme.purple_50, Color(0xFFF9D8E5)],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomIconButton(
              iconPath: model?.icon ?? ImageConstant.imgIcon,
              size: 32.h,
              backgroundColor: appTheme.blue_gray_900,
              borderRadius: 16.h,
              padding: EdgeInsets.all(6.h),
              margin: EdgeInsets.only(top: 4.h),
              iconSize: 20.h,
            ),
            SizedBox(height: 24.h),
            Text(
              model?.title ?? "My dashboard",
              style: TextStyleHelper.instance.body12BoldEncodeSans.copyWith(
                color: appTheme.gray_900,
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model?.subtitle ?? "View trades",
                  style: TextStyleHelper.instance.body12RegularInter.copyWith(
                    color: appTheme.gray_900_01,
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgIconsUAngleRight,
                  height: 18.h,
                  width: 18.h,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
