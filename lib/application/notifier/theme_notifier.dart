import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_app/providers.dart';
import 'package:template_app/shared/constants/constants.dart';

class AppThemeNotifier extends StateNotifier<bool> {
  AppThemeNotifier(this.defaultDarkModeValue) : super(defaultDarkModeValue);

  final bool defaultDarkModeValue;

  toggleAppTheme(BuildContext context) {
    final _isDarkModeEnabled = context
        .read(hiveUtilsProvider)
        .getBoolValue(HiveKeys.DARK_MODE_ENABLED);
    final _toggleValue = !_isDarkModeEnabled;

    context
        .read(
          hiveUtilsProvider,
        )
        .setBoolValue(HiveKeys.DARK_MODE_ENABLED, _toggleValue)
        .whenComplete(
          () => {
            state = _toggleValue,
          },
        );
  }
}
