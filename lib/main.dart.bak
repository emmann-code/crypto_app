import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:roquu_app/core/app_exports.dart';
import 'package:roquu_app/core/utils/navigator_service.dart';
import 'package:roquu_app/core/utils/size_utils.dart';
import 'package:roquu_app/routes/app_routes.dart';
import 'package:roquu_app/theme/theme_helper.dart';
import 'presentation/copy_trading/copy_trading_screen.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();
const bool kUseCopyTradingAsHome = true;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]).then((value) {
    runApp(
      ProviderScope(
        child: DevicePreview(
          enabled: !kReleaseMode,
          builder: (context) => MyApp(),
        ),
      ),
    );
  });
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'copy_trading_pro',
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: (context, child) {
            final previewed = DevicePreview.appBuilder(context, child);
            return MediaQuery(
              data: MediaQuery.of(
                context,
              ).copyWith(textScaler: TextScaler.linear(1.0)),
              child: previewed,
            );
          },
          navigatorKey: NavigatorService.navigatorKey,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [Locale('en', '')],
          home: kUseCopyTradingAsHome ? const CopyTradingScreen() : null,
          initialRoute: kUseCopyTradingAsHome ? null : AppRoutes.initialRoute,
          routes: kUseCopyTradingAsHome
              ? const <String, WidgetBuilder>{}
              : AppRoutes.routes,
        );
      },
    );
  }
}
