part of 'app_navigation_notifier.dart';

class AppNavigationState extends Equatable {
  AppNavigationState({this.appNavigationModelObj});
  AppNavigationModel? appNavigationModelObj;
  @override
  List<Object?> get props => [appNavigationModelObj];
  AppNavigationState copyWith({AppNavigationModel? appNavigationModelObj}) {
    return AppNavigationState(
      appNavigationModelObj:
      appNavigationModelObj ?? this.appNavigationModelObj,
    );
  }
}
