import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:template_app/shared/providers/theme_provider.dart';
import 'package:template_app/shared/utils/locale_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _appThemeStateProvider = context.read(appThemeStateProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Text("Dark Mode"),
            trailing: Consumer(builder: (context, watch, child) {
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
          ListTile(
            leading: Text("Language"),
            trailing: DropdownButton(
              value: LocaleUtils.getCurrentLocaleName(),
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
                // context.locale = Locale(
                //     LocaleUtils.getLocaleCodeForName(val.toString()));
                //box.put(HiveKeys.CURRENT_LANGUAGE, val);
              },
            ),
          ),
        ],
      ),
    );
  }
}
