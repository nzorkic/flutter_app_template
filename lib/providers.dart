// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:template_app/application/config/app_settings.dart';
import 'package:template_app/application/config/hive_constants.dart';
import 'package:template_app/application/notifier/locale_notifier.dart';
import 'package:template_app/application/notifier/theme_notifier.dart';
import 'package:template_app/application/theme.dart';
import 'package:template_app/utils/hive_utils.dart';

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

final localeStateProvider =
    StateNotifierProvider<LocaleNotifier, String>((ref) {
  final _currentLocale = ref.read(hiveUtilsProvider).getStringValue(
      HiveKeys.CURRENT_LANGUAGE,
      defaultValue: Settings.FALLBACK_LANGUAGE);
  return LocaleNotifier(_currentLocale);
});
