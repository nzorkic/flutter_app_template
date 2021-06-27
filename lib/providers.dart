// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:template_app/application/config/app_constants.dart';
import 'package:template_app/application/config/storage_constants.dart';
import 'package:template_app/application/notifier/locale_notifier.dart';
import 'package:template_app/application/notifier/theme_notifier.dart';
import 'package:template_app/application/theme.dart';
import 'package:template_app/utils/storage_utils.dart';

final settingsBoxProvider = Provider<Box>((ref) {
  throw UnimplementedError();
});

final appThemeProvider = Provider<AppTheme>((ref) {
  return AppTheme();
});

final storageUtilsProvider = Provider<StorageUtils>((ref) {
  final _storage = ref.watch(settingsBoxProvider);
  return StorageUtils(box: _storage);
});

final appThemeStateProvider =
    StateNotifierProvider<AppThemeNotifier, bool>((ref) {
  final _isDarkModeEnabled = ref
      .read(storageUtilsProvider)
      .getBoolValue(StorageValues.DARK_THEME_ENABLED);
  return AppThemeNotifier(_isDarkModeEnabled);
});

final localeStateProvider =
    StateNotifierProvider<LocaleNotifier, String>((ref) {
  final _currentLocale = ref.read(storageUtilsProvider).getStringValue(
      StorageValues.CURRENT_LANGUAGE,
      defaultValue: Constants.FALLBACK_LANGUAGE);
  return LocaleNotifier(_currentLocale);
});
