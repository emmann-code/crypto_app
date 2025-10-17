import 'package:flutter/material.dart';
import 'package:roquu_app/presentation/copy_trading_dashboard/copy_trading_dashboardscreen.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String copyTradingDashboardScreen =
      '/copy_trading_dashboard_screen';

  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/';

  static Map<String, WidgetBuilder> get routes => {
    copyTradingDashboardScreen: (context) => CopyTradingDashboardScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => AppNavigationScreen(),
  };
}
