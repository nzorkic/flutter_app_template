// Package imports:
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:template_app/application/config/app_constants.dart';
import 'package:template_app/application/config/storage_constants.dart';
import 'package:template_app/providers.dart';

class LocaleUtils {
  LocaleUtils._();

  static const String _fallbackLanguage = Constants.FALLBACK_LANGUAGE;
  static const Map<String, String> _localesMap = Constants.LOCALES;

  static List<String> getLocaleNames() {
    return _localesMap.values.toList();
  }

  static List<String> getLocaleCodes() {
    return _localesMap.keys.toList();
  }

  static String getCurrentLocaleName() {
    return useProvider(storageUtilsProvider).getStringValue(
        StorageValues.CURRENT_LANGUAGE,
        defaultValue: _localesMap[_fallbackLanguage]!);
  }

  static String getCurrentLocaleCode() {
    var name = useProvider(storageUtilsProvider)
        .getStringValue(StorageValues.CURRENT_LANGUAGE);
    return _localesMap.keys.firstWhere((key) => _localesMap[key] == name,
        orElse: () => _fallbackLanguage);
  }

  static String getLocaleCodeForName(String? name) {
    if (name == null) {
      return _fallbackLanguage;
    }
    return _localesMap.keys.firstWhere((key) => _localesMap[key] == name,
        orElse: () => _fallbackLanguage);
  }
}
