import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template_app/application/notifier/theme_notifier.dart';
import 'package:template_app/shared/constants/constants.dart';
import 'package:template_app/shared/utils/hive_utils.dart';

import 'application/theme.dart';

final settingsBoxProvider = Provider<Box>((ref) {
  throw UnimplementedError();
});

final appThemeProvider = Provider<AppTheme>((ref) {
  return AppTheme();
});

final hiveUtilsProvider = Provider<HiveUtils>((ref) {
  final _hive = ref.watch(settingsBoxProvider);
  return HiveUtils(box: _hive);
});

final appThemeStateProvider =
    StateNotifierProvider<AppThemeNotifier, bool>((ref) {
  final _isDarkModeEnabled =
      ref.read(hiveUtilsProvider).getBoolValue(HiveKeys.DARK_THEME_ENABLED);
  return AppThemeNotifier(_isDarkModeEnabled);
});
