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
          onTap: () => context.router.pop(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Switch(
              value: _appThemeStateProvider.state,
              onChanged: (val) {
                _appThemeStateProvider.toggleAppTheme(context);
              },
            ),
            SizedBox(
              height: 30,
            ),
            DropdownButton(
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
          ],
        ),
      ),
    );
  }
}
