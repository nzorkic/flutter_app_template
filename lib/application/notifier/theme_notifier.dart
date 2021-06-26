import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_app/providers.dart';
import 'package:template_app/shared/constants/constants.dart';

class AppThemeNotifier extends StateNotifier<bool> {
  AppThemeNotifier(this.isDarkTheme) : super(isDarkTheme);

  final bool isDarkTheme;

  toggleAppTheme(BuildContext context) {
    final _isDarkThemeEnabled = context
        .read(hiveUtilsProvider)
        .getBoolValue(HiveKeys.DARK_THEME_ENABLED);
    final _toggleValue = !_isDarkThemeEnabled;

    context
        .read(
          hiveUtilsProvider,
        )
        .setBoolValue(HiveKeys.DARK_THEME_ENABLED, _toggleValue)
        .whenComplete(
          () => {
            state = _toggleValue,
          },
        );
  }
}
