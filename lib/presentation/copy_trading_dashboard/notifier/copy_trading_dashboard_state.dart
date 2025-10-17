part of 'copy_trading_dashboard_notifier.dart';

class CopyTradingDashboardState extends Equatable {
  final CopyTradingDashboardModel? copyTradingDashboardModel;
  final bool? isLoading;
  final bool? isSuccess;

  CopyTradingDashboardState({
    this.copyTradingDashboardModel,
    this.isLoading = false,
    this.isSuccess = false,
  });

  @override
  List<Object?> get props => [
    copyTradingDashboardModel,
    isLoading,
    isSuccess,
  ];

  CopyTradingDashboardState copyWith({
    CopyTradingDashboardModel? copyTradingDashboardModel,
    bool? isLoading,
    bool? isSuccess,
  }) {
    return CopyTradingDashboardState(
      copyTradingDashboardModel:
      copyTradingDashboardModel ?? this.copyTradingDashboardModel,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
