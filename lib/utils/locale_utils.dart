// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:template_app/application/config/app_constants.dart';
import 'package:template_app/application/config/storage_constants.dart';

class LocaleUtils {
  LocaleUtils._();

  static final String _fallbackLanguage = Constants.FALLBACK_LANGUAGE;
  static final Map<String, String> _localesMap = Constants.LOCALES;
  static final Box _box = Hive.box(Storages.SETTINGS_STORAGE);

  static List<String> getLocaleNames() {
    return _localesMap.values.toList();
  }

  static List<String> getLocaleCodes() {
    return _localesMap.keys.toList();
  }

  static String getCurrentLocaleName() {
    return _box.get(StorageValues.CURRENT_LANGUAGE,
        defaultValue: _localesMap[_fallbackLanguage]);
  }

  static String getCurrentLocaleCode() {
    var name = _box.get(StorageValues.CURRENT_LANGUAGE, defaultValue: "");
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
