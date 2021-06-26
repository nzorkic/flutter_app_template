import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:template_app/providers.dart';
import 'package:template_app/shared/constants/constants.dart';
import 'package:template_app/shared/utils/locale_utils.dart';

class LocaleNotifier extends StateNotifier<String> {
  LocaleNotifier(this.currentLocale) : super(currentLocale);

  final String currentLocale;

  changeLocale(BuildContext context, String localeName) {
    String _localeCode = LocaleUtils.getLocaleCodeForName(localeName);
    context
        .read(hiveUtilsProvider)
        .setStringValue(HiveKeys.CURRENT_LANGUAGE, _localeCode)
        .whenComplete(
          () => {
            context.setLocale(Locale(_localeCode)),
            state = localeName,
          },
        );
  }
}
