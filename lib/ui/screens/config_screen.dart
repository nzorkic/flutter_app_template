import 'package:flutter/material.dart';
import 'package:template_app/providers.dart';
import 'package:template_app/shared/utils/locale_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:template_app/ui/widgets/settings_tile.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appThemeStateProvider = context.read(appThemeStateProvider.notifier);
    final _localeStateProvider = context.read(localeStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(tr('settings_page')),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          SettingTile(
            leadingText: tr('dark_mode'),
            trailingWidget: Consumer(builder: (context, watch, child) {
              final bool _isDarkMode = watch(appThemeStateProvider);
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    color: Colors.yellow[700],
                  ),
                  Switch(
                    value: _isDarkMode,
                    onChanged: (val) {
                      _appThemeStateProvider.toggleAppTheme(context);
                    },
                  ),
                ],
              );
            }),
          ),
          SettingTile(
            leadingText: tr('language'),
            trailingWidget: Consumer(
              builder: (context, watch, child) {
                final String _currentLocale = watch(localeStateProvider);

                return DropdownButton(
                  value: _currentLocale,
                  icon: Icon(Icons.arrow_downward),
                  items: LocaleUtils.getLocaleNames().map(
                    (String lang) {
                      return DropdownMenuItem(
                        child: Text(lang),
                        value: lang,
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    _localeStateProvider.changeLocale(context, val.toString());
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
