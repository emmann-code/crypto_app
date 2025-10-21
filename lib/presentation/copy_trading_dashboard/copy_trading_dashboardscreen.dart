import 'package:flutter/material.dart';
import 'package:roquu_app/core/app_exports.dart';
import '../../widgets/custom_app_bar.dart';
import './widgets/dashboard_card_item.dart';
import './widgets/trader_card_item.dart';
import 'notifier/copy_trading_dashboard_notifier.dart';
class CopyTradingDashboardScreen extends ConsumerStatefulWidget {
  const CopyTradingDashboardScreen({super.key});
  @override
  CopyTradingDashboardScreenState createState() =>
      CopyTradingDashboardScreenState();
}
class CopyTradingDashboardScreenState
    extends ConsumerState<CopyTradingDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.gray_900,
        appBar: CustomAppBar(
          title: "Copy trading",
          backgroundColor: appTheme.gray_900,
          titleColor: appTheme.whiteCustom,
          leadingIcon: ImageConstant.imgArrow,
          onLeadingPressed: () => NavigatorService.goBack(),
        ),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            spacing: 32.h,
            children: [
              SizedBox(height: 16.h),
              _buildDashboardCards(context),
              _buildProTradersSection(context),
            ],
          ),
        ),
      ),
    );
  }
  
  Widget _buildDashboardCards(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final state = ref.watch(copyTradingDashboardNotifier);
        return Row(
          spacing: 16.h,
          children: [
            Expanded(
              child: DashboardCardItem(
                model: state.copyTradingDashboardModel?.dashboardCards?[0],
                onTap: () {
                  onTapDashboardCard(context, "My dashboard");
                },
              ),
            ),
            Expanded(
              child: DashboardCardItem(
                model: state.copyTradingDashboardModel?.dashboardCards?[1],
                onTap: () {
                  onTapDashboardCard(context, "Become a PRO trader");
                },
              ),
            ),
          ],
        );
      },
    );
  }
  
  Widget _buildProTradersSection(BuildContext context) {
    return Expanded(
      child: Column(
        spacing: 8.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PRO Traders",
            style: TextStyleHelper.instance.title16BoldEncodeSans,
          ),
          _buildTradersList(context),
        ],
      ),
    );
  }
  
  Widget _buildTradersList(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (context, ref, _) {
          final state = ref.watch(copyTradingDashboardNotifier);
          return ListView.separated(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 16.h);
            },
            itemCount:
                state.copyTradingDashboardModel?.tradersList?.length ?? 0,
            itemBuilder: (context, index) {
              final model =
                  state.copyTradingDashboardModel?.tradersList?[index];
              return TraderCardItem(
                model: model,
                onCopyTap: () {
                  onTapCopyButton(context, model?.name ?? "");
                },
              );
            },
          );
        },
      ),
    );
  }
  
  void onTapBackButton(BuildContext context) {
    NavigatorService.goBack();
  }
  
  void onTapDashboardCard(BuildContext context, String cardType) {
    
    print("Dashboard card tapped: $cardType");
  }
  
  void onTapCopyButton(BuildContext context, String traderName) {
    
    print("Copy button tapped for trader: $traderName");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Started copying $traderName"),
        backgroundColor: appTheme.green_A700,
      ),
    );
  }
}
