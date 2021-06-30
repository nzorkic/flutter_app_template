// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:template_app/application/config/storage_constants.dart';
import 'package:template_app/application/logging/log_pens.dart';
import 'package:template_app/application/logging/logger_types.dart';
import 'package:template_app/providers.dart';
import 'package:template_app/utils/locale_utils.dart';

class LocaleNotifier extends StateNotifier<String> with UtilityLogger {
  LocaleNotifier(this.currentLocale) : super(currentLocale);

  final String currentLocale;

  changeLocale(BuildContext context, String localeName) {
    String _localeCode = LocaleUtils.getLocaleCodeForName(localeName);
    context
        .read(storageUtilsProvider)
        .setStringValue(StorageValues.CURRENT_LANGUAGE, _localeCode)
        .whenComplete(
          () => {
            context.setLocale(Locale(_localeCode)),
            state = _localeCode,
            logger.info(penInfo('Locale changed to $_localeCode')),
          },
        )
        .onError((error, stackTrace) =>
            logger.warning(penWarning('Failed to change app theme')));
  }
}
