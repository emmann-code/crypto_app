import 'package:roquu_app/core/app_exports.dart';
import '../widgets/dashboard_card_item.dart';

class DashboardCardItemModel extends Equatable {
  DashboardCardItemModel({
    this.icon,
    this.title,
    this.subtitle,
    this.backgroundGradient,
  }) {
    icon = icon ?? ImageConstant.imgIcon;
    title = title ?? "My dashboard";
    subtitle = subtitle ?? "View trades";
    backgroundGradient =
        backgroundGradient ??
        "linear-gradient(134deg,#abe2f3 0%,#bde4e5 50%, #ebe9d0 100%)";
  }
  String? icon;
  String? title;
  String? subtitle;
  String? backgroundGradient;
  DashboardCardItemModel copyWith({
    String? icon,
    String? title,
    String? subtitle,
    String? backgroundGradient,
  }) {
    return DashboardCardItemModel(
      icon: icon ?? this.icon,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      backgroundGradient: backgroundGradient ?? this.backgroundGradient,
    );
  }
  @override
  List<Object?> get props => [icon, title, subtitle, backgroundGradient];
}
