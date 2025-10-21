import 'package:roquu_app/core/app_exports.dart';
import '../widgets/trader_card_item.dart';

class TraderItemModel extends Equatable {
  TraderItemModel({
    this.initials,
    this.name,
    this.followers,
    this.roi,
    this.totalPnl,
    this.winRate,
    this.aum,
    this.chartImage,
    this.profileImage,
  }) {
    initials = initials ?? "JI";
    name = name ?? "Jay isisou";
    followers = followers ?? "500";
    roi = roi ?? "+120.42%";
    totalPnl = totalPnl ?? "\$38,667.29";
    winRate = winRate ?? "100%";
    aum = aum ?? "38,667.29";
    chartImage = chartImage ?? ImageConstant.imgChart;
    profileImage = profileImage ?? ImageConstant.imgGroup;
  }
  String? initials;
  String? name;
  String? followers;
  String? roi;
  String? totalPnl;
  String? winRate;
  String? aum;
  String? chartImage;
  String? profileImage;
  TraderItemModel copyWith({
    String? initials,
    String? name,
    String? followers,
    String? roi,
    String? totalPnl,
    String? winRate,
    String? aum,
    String? chartImage,
    String? profileImage,
  }) {
    return TraderItemModel(
      initials: initials ?? this.initials,
      name: name ?? this.name,
      followers: followers ?? this.followers,
      roi: roi ?? this.roi,
      totalPnl: totalPnl ?? this.totalPnl,
      winRate: winRate ?? this.winRate,
      aum: aum ?? this.aum,
      chartImage: chartImage ?? this.chartImage,
      profileImage: profileImage ?? this.profileImage,
    );
  }
  @override
  List<Object?> get props => [
    initials,
    name,
    followers,
    roi,
    totalPnl,
    winRate,
    aum,
    chartImage,
    profileImage,
  ];
}
