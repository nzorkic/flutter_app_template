// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:template_app/application/config/app_settings.dart';
import 'package:template_app/application/logging/log_pens.dart';
import 'package:template_app/application/logging/logger_types.dart';
import 'package:template_app/providers.dart';
import 'package:template_app/ui/widgets/settings_tile.dart';
import 'package:template_app/utils/locale_utils.dart';

class SettingsScreen extends ConsumerWidget with UiLogger {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    logger.info(penInfo('Build started...'));
    final _appThemeStateProvider = context.read(appThemeStateProvider.notifier);
    final _localeStateProvider = context.read(localeStateProvider.notifier);

    final bool _isDarkMode = watch(appThemeStateProvider);

    var _themeSwitch = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          _isDarkMode ? Icons.dark_mode : Icons.light_mode,
          color: Colors.yellow[700],
        ),
        Switch(
          value: _isDarkMode,
          onChanged: (val) => _appThemeStateProvider.toggleAppTheme(context),
        ),
      ],
    );

    final String _currentLocale = watch(localeStateProvider);

    var _localeSelector = DropdownButton(
      value: Settings.LOCALES[_currentLocale],
      icon: Icon(Icons.arrow_downward),
      items: LocaleUtils.getLocaleNames().map(
        (String lang) {
          return DropdownMenuItem(
            child: Text(lang),
            value: lang,
          );
        },
      ).toList(),
      onChanged: (val) =>
          _localeStateProvider.changeLocale(context, val.toString()),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('settings_page_title')),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => context.popRoute(),
        ),
      ),
      body: Column(
        children: [
          SettingTile(
            leadingText: tr('dark_mode'),
            trailingWidget: _themeSwitch,
          ),
          SettingTile(
            leadingText: tr('language'),
            trailingWidget: _localeSelector,
          )
        ],
      ),
    );
  }
}
