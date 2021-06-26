// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:template_app/shared/constants/hive.dart';
import 'package:template_app/shared/constants/settings.dart';

class LocaleUtils {
  LocaleUtils._();

  static Box _box = Hive.box(HiveBoxes.SETTINGS_BOX);

  static List<String> getLocaleNames() {
    return Locales.LOCALES.values.toList();
  }

  static List<String> getLocaleCodes() {
    return Locales.LOCALES.keys.toList();
  }

  static String getCurrentLocaleName() {
    return _box.get(HiveKeys.CURRENT_LANGUAGE,
        defaultValue: Locales.LOCALES[Locales.FALLBACK_LANGUAGE]);
  }

  static String getCurrentLocaleCode() {
    var name = _box.get(HiveKeys.CURRENT_LANGUAGE, defaultValue: "");
    return Locales.LOCALES.keys.firstWhere(
        (key) => Locales.LOCALES[key] == name,
        orElse: () => Locales.FALLBACK_LANGUAGE);
  }

  static String getLocaleCodeForName(String? name) {
    if (name == null) {
      return Locales.FALLBACK_LANGUAGE;
    }
    return Locales.LOCALES.keys.firstWhere(
        (key) => Locales.LOCALES[key] == name,
        orElse: () => Locales.FALLBACK_LANGUAGE);
  }
}
