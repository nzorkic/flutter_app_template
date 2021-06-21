import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template_app/shared/config/theme.dart';
import 'package:template_app/shared/constants/constants.dart';

import 'shared/utils/hive_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
  await Hive.initFlutter();
  await Hive.openBox(HiveConfig.SETTINGS_BOX);
  runApp(
    EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [
          Locale('en'),
          Locale('rs'),
        ],
        fallbackLocale: const Locale('en'),
        useFallbackTranslations: true,
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box(HiveConfig.SETTINGS_BOX).listenable(),
      builder: (context, box, widget) {
        bool darkModeEnabled =
            box.get(HiveConfig.DARK_MODE_ENABLED, defaultValue: false);

        return MaterialApp(
          title: 'App Template',
          darkTheme: AppThemes.darkTheme,
          theme: AppThemes.lightTheme,
          themeMode: darkModeEnabled ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/bird.png',
                    width: 350,
                    height: 150,
                  ),
                  Divider(),
                  Text(
                    'greeting'.tr(),
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Switch(
                    value: box.get(HiveConfig.DARK_MODE_ENABLED,
                        defaultValue: false),
                    onChanged: (val) {
                      box.put(HiveConfig.DARK_MODE_ENABLED, val);
                    },
                  ),
                  // Switch(
                  //   value: box.get(HiveConfig.CHANGE_LANGUAGE,
                  //       defaultValue: LocaleConfig.FALLBACK_LANGUAGE),
                  //   onChanged: (_) {
                  //     box.put(HiveConfig.CHANGE_LANGUAGE, 'rs');
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
