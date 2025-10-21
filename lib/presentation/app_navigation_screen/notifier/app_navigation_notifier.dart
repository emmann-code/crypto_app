import 'package:flutter_riverpod/legacy.dart';
import 'package:roquu_app/core/app_exports.dart';
import '../models/app_navigation_model.dart';
part 'app_navigation_state.dart';
final appNavigationNotifier =
    StateNotifierProvider.autoDispose<
      AppNavigationNotifier,
      AppNavigationState
    >((ref) => AppNavigationNotifier(AppNavigationState()));

class AppNavigationNotifier extends StateNotifier<AppNavigationState> {
  AppNavigationNotifier(super.state);
}
