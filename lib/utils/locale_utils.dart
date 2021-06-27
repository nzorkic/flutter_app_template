// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:template_app/application/config/app_settings.dart';
import 'package:template_app/application/config/hive_constants.dart';

class LocaleUtils {
  LocaleUtils._();

  static Map<String, String> _localesMap = Settings.LOCALES;
  static Box _box = Hive.box(HiveBoxes.SETTINGS_BOX);

  static List<String> getLocaleNames() {
    return _localesMap.values.toList();
  }

  static List<String> getLocaleCodes() {
    return _localesMap.keys.toList();
  }

  static String getCurrentLocaleName() {
    return _box.get(HiveKeys.CURRENT_LANGUAGE,
        defaultValue: _localesMap[Settings.FALLBACK_LANGUAGE]);
  }

  static String getCurrentLocaleCode() {
    var name = _box.get(HiveKeys.CURRENT_LANGUAGE, defaultValue: "");
    return _localesMap.keys.firstWhere((key) => _localesMap[key] == name,
        orElse: () => Settings.FALLBACK_LANGUAGE);
  }

  static String getLocaleCodeForName(String? name) {
    if (name == null) {
      return Settings.FALLBACK_LANGUAGE;
    }
    return _localesMap.keys.firstWhere((key) => _localesMap[key] == name,
        orElse: () => Settings.FALLBACK_LANGUAGE);
  }
}
