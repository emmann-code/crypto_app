import 'package:roquu_app/core/app_exports.dart';

import './dashboard_card_item_model.dart';
import './trader_item_model.dart';


// ignore_for_file: must_be_immutable
class CopyTradingDashboardModel extends Equatable {
  CopyTradingDashboardModel({this.dashboardCards, this.tradersList}) {
    dashboardCards = dashboardCards ?? [];
    tradersList = tradersList ?? [];
  }

  List<DashboardCardItemModel>? dashboardCards;
  List<TraderItemModel>? tradersList;

  CopyTradingDashboardModel copyWith({
    List<DashboardCardItemModel>? dashboardCards,
    List<TraderItemModel>? tradersList,
  }) {
    return CopyTradingDashboardModel(
      dashboardCards: dashboardCards ?? this.dashboardCards,
      tradersList: tradersList ?? this.tradersList,
    );
  }

  @override
  List<Object?> get props => [dashboardCards, tradersList];
}
