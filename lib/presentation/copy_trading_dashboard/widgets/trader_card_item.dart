import 'package:flutter/material.dart';
import 'package:roquu_app/core/app_exports.dart';
import 'package:roquu_app/theme/theme_helper.dart';

import '../../../widgets/custom_copy_button.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/trader_item_model.dart';

class TraderCardItem extends StatelessWidget {
  final TraderItemModel? model;
  final VoidCallback? onCopyTap;

  TraderCardItem({Key? key, this.model, this.onCopyTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(14.h),
          decoration: BoxDecoration(
            color: appTheme.gray_900_01,
            border: Border(
              top: BorderSide(color: appTheme.blue_gray_900_01, width: 1.h),
              left: BorderSide(color: appTheme.blue_gray_900_01, width: 1.h),
              right: BorderSide(color: appTheme.blue_gray_900_01, width: 1.h),
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.h),
              topRight: Radius.circular(16.h),
            ),
          ),
          child: Column(
            children: [
              Row(
                spacing: 12.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileSection(context),
                  _buildTraderInfo(context),
                  CustomCopyButton(
                    text: "Copy",
                    onPressed: onCopyTap,
                    backgroundColor: appTheme.gray_900,
                    textColor: appTheme.blue_gray_200,
                    borderColor: appTheme.blue_gray_900_01,
                    height: 29.h,
                    fontSize: 14.fSize,
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Container(
                height: 1.h,
                width: double.infinity,
                color: appTheme.blue_gray_900_01,
              ),
              SizedBox(height: 14.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      spacing: 2.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ROI",
                          style: TextStyleHelper.instance.body12RegularInter,
                        ),
                        Text(
                          model?.roi ?? "+120.42%",
                          style: TextStyleHelper.instance.body14BoldEncodeSans,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Total PNL: ",
                                style:
                                    TextStyleHelper.instance.body12RegularInter,
                              ),
                              TextSpan(
                                text: model?.totalPnl ?? "\$38,667.29",
                                style: TextStyleHelper
                                    .instance
                                    .body12BoldEncodeSans,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomImageView(
                    imagePath: model?.chartImage ?? ImageConstant.imgChart,
                    height: 50.h,
                    width: 132.h,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 12.h),
          decoration: BoxDecoration(
            color: appTheme.gray_900,
            border: Border.all(color: appTheme.blue_gray_900_01, width: 1.h),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.h),
              bottomRight: Radius.circular(16.h),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Win rate: ",
                      style: TextStyleHelper.instance.body12RegularInter,
                    ),
                    TextSpan(
                      text: model?.winRate ?? "100%",
                      style: TextStyleHelper.instance.body12BoldEncodeSans,
                    ),
                  ],
                ),
              ),
              Spacer(),
              CustomImageView(
                imagePath: ImageConstant.imgIconsUInfoCircle,
                height: 12.h,
                width: 12.h,
              ),
              SizedBox(width: 4.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "AUM: ",
                      style: TextStyleHelper.instance.body12RegularInter,
                    ),
                    TextSpan(
                      text: model?.aum ?? "38,667.29",
                      style: TextStyleHelper.instance.body12BoldEncodeSans,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileSection(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 38.h,
          height: 38.h,
          decoration: BoxDecoration(
            color: appTheme.colorFF235C,
            borderRadius: BorderRadius.circular(18.h),
          ),
          child: Center(
            child: Text(
              model?.initials ?? "JI",
              style: TextStyleHelper.instance.body14BoldInter,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: CustomImageView(
            imagePath: model?.profileImage ?? ImageConstant.imgGroup,
            height: 18.h,
            width: 14.h,
          ),
        ),
      ],
    );
  }

  Widget _buildTraderInfo(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model?.name ?? "Jay isisou",
            style: TextStyleHelper.instance.body14RegularInter,
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgIconsUUsersAlt,
                height: 12.h,
                width: 12.h,
              ),
              SizedBox(width: 4.h),
              Text(
                model?.followers ?? "500",
                style: TextStyleHelper.instance.body12RegularInter.copyWith(
                  color: appTheme.light_blue_200,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
