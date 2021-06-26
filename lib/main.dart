import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:template_app/shared/constants/constants.dart';
import 'package:template_app/shared/providers/theme_provider.dart';
import 'package:template_app/shared/utils/hive_utils.dart';
import 'package:template_app/shared/utils/locale_utils.dart';
import 'package:template_app/ui/screens/home_screen.dart';

import 'shared/router/app_router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  if (Platform.isAndroid) {
    await FlutterDisplayMode.setHighRefreshRate();
  }
  await Hive.initFlutter();
  Box settingsBox = await Hive.openBox(HiveBoxes.SETTINGS_BOX);
  runApp(
    ProviderScope(
      overrides: [
        settingsBoxProvider.overrideWithValue(settingsBox),
      ],
      child: EasyLocalization(
          path: Locales.PATH,
          supportedLocales:
              LocaleUtils.getLocaleCodes().map((lang) => Locale(lang)).toList(),
          useFallbackTranslations: true,
          fallbackLocale: const Locale(Locales.FALLBACK_LANGUAGE),
          child: MyApp()),
    ),
  );
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final bool _appThemeState = watch(appThemeStateProvider);
    final _appRouter = AppRouter();
    return MaterialApp(
      theme: context
          .read(appThemeProvider)
          .getAppThemedata(context, _appThemeState),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      //locale: Locale(LocaleUtils.getCurrentLocaleCode()),
      locale: context.locale,
      // routerDelegate: _appRouter.delegate(),
      // routeInformationParser: _appRouter.defaultRouteParser(),
      home: HomeScreen(),
      builder: (context, router) => router!,
    );
  }
}
