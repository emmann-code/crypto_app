import 'package:flutter_riverpod/legacy.dart';
import 'package:roquu_app/core/app_exports.dart';
import 'package:roquu_app/core/utils/image_constant.dart';
import 'package:roquu_app/presentation/copy_trading_dashboard/models/copy_trading_dashboard_models.dart';

import '../models/dashboard_card_item_model.dart';
import '../models/trader_item_model.dart';

part 'copy_trading_dashboard_state.dart';

final copyTradingDashboardNotifier =
    StateNotifierProvider.autoDispose<
      CopyTradingDashboardNotifier,
      CopyTradingDashboardState
    >(
      (ref) => CopyTradingDashboardNotifier(
        CopyTradingDashboardState(
          copyTradingDashboardModel: CopyTradingDashboardModel(),
        ),
      ),
    );

class CopyTradingDashboardNotifier
    extends StateNotifier<CopyTradingDashboardState> {
  CopyTradingDashboardNotifier(CopyTradingDashboardState state) : super(state) {
    initialize();
  }

  void initialize() {
    state = state.copyWith(
      copyTradingDashboardModel: CopyTradingDashboardModel(
        dashboardCards: [
          DashboardCardItemModel(
            icon: ImageConstant.imgIcon,
            title: "My dashboard",
            subtitle: "View trades",
            backgroundGradient:
                "linear-gradient(134deg,#abe2f3 0%,#bde4e5 50%, #ebe9d0 100%)",
          ),
          DashboardCardItemModel(
            icon: ImageConstant.imgIcon,
            title: "Become a PRO trader",
            subtitle: "Apply Now",
            backgroundGradient:
                "linear-gradient(134deg,#c0cffe 0%,#f3dff4 50%, #f9d8e5 100%)",
          ),
        ],
        tradersList: [
          TraderItemModel(
            initials: "JI",
            name: "Jay isisou",
            followers: "500",
            roi: "+120.42%",
            totalPnl: "\$38,667.29",
            winRate: "100%",
            aum: "38,667.29",
            chartImage: ImageConstant.imgChart,
            profileImage: ImageConstant.imgGroup,
          ),
          TraderItemModel(
            initials: "JI",
            name: "Jay isisou",
            followers: "500",
            roi: "+120.42%",
            totalPnl: "\$38,667.29",
            winRate: "100%",
            aum: "38,667.29",
            chartImage: ImageConstant.imgChart,
            profileImage: ImageConstant.imgGroup,
          ),
          TraderItemModel(
            initials: "JI",
            name: "Jay isisou",
            followers: "500",
            roi: "+120.42%",
            totalPnl: "\$38,667.29",
            winRate: "100%",
            aum: "38,667.29",
            chartImage: ImageConstant.imgChart,
            profileImage: ImageConstant.imgGroup,
          ),
        ],
      ),
      isLoading: false,
    );
  }

  void onCopyTrader(String traderId) {
    state = state.copyWith(isLoading: true);

    // Simulate copy action
    Future.delayed(Duration(seconds: 1), () {
      state = state.copyWith(isLoading: false, isSuccess: true);
    });
  }
}
