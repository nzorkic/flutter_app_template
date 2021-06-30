// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:template_app/application/config/app_constants.dart';
import 'package:template_app/application/logging/log_pens.dart';
import 'package:template_app/application/logging/logger_types.dart';
import 'package:template_app/providers.dart';
import 'package:template_app/ui/widgets/settings_screen/drop_down_selector.dart';
import 'package:template_app/ui/widgets/settings_screen/settings_tile.dart';
import 'package:template_app/ui/widgets/settings_screen/theme_toggle.dart';

class SettingsScreen extends ConsumerWidget with UiLogger {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    logger.info(penInfo('Building SettingsScreen...'));
    final _appThemeStateProvider = context.read(appThemeStateProvider.notifier);
    final _localeStateProvider = context.read(localeStateProvider.notifier);

    final String _currentLocale = watch(localeStateProvider);
    final bool _isDarkMode = watch(appThemeStateProvider);

    void _changeLocale(String val) =>
        _localeStateProvider.changeLocale(context, val.toString());

    void _toggleTheme(BuildContext ctx) =>
        _appThemeStateProvider.toggleAppTheme(ctx);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('settings_page_title')),
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () => context.popRoute(),
        ),
      ),
      body: Column(
        children: [
          SettingTile(
            leadingText: tr('dark_mode'),
            trailingWidget: ThemeToggle(
              isDarkMode: _isDarkMode,
              onChangedFn: _toggleTheme,
            ),
          ),
          SettingTile(
            leadingText: tr('language'),
            trailingWidget: DropDownSelector(
              value: Constants.LOCALES[_currentLocale]!,
              items: Constants.LOCALES.values.toList(),
              onChangeFn: _changeLocale,
            ),
          ),
        ],
      ),
    );
  }
}
