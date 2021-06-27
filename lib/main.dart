// Dart imports:
import 'dart:io';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:template_app/application/config/app_settings.dart';
import 'package:template_app/application/config/hive_constants.dart';
import 'package:template_app/application/init_log.dart';
import 'package:template_app/application/logging/log_pens.dart';
import 'package:template_app/application/logging/logger_types.dart';
import 'package:template_app/application/navigation/app_router.gr.dart';
import 'package:template_app/application/rs_delegate.dart';
import 'package:template_app/providers.dart';
import 'package:template_app/utils/locale_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  await EasyLocalization.ensureInitialized();
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
  await Hive.initFlutter();
  Box settingsBox = await Hive.openBox(HiveBoxes.SETTINGS_BOX);
  initLog();
  logFunction('main').info(penInfo("initialization completed!"));
  runApp(
    ProviderScope(
      overrides: [
        settingsBoxProvider.overrideWithValue(settingsBox),
      ],
      child: EasyLocalization(
        path: Settings.TRANSLATIONS_PATH,
        supportedLocales:
            LocaleUtils.getLocaleCodes().map((lang) => Locale(lang)).toList(),
        useFallbackTranslations: true,
        fallbackLocale: const Locale(Settings.FALLBACK_LANGUAGE),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final bool _appThemeState = watch(appThemeStateProvider);

    return MaterialApp.router(
      theme: context
          .read(appThemeProvider)
          .getAppThemeData(context, _appThemeState),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        ...context.localizationDelegates,
        MaterialLocalizationRsDelegate()
      ],
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
