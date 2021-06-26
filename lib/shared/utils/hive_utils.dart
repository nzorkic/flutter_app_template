// Package imports:
import 'package:hive_flutter/hive_flutter.dart';

// Project imports:
import 'package:template_app/shared/constants/settings.dart';

// Project imports:

class HiveUtils {
  HiveUtils({
    required this.box,
  });

  final Box box;

  bool getBoolValue(String key, {bool value = false}) {
    return box.get(key, defaultValue: value);
  }

  Future<void> setBoolValue(String key, bool value) async {
    return await box.put(key, value);
  }

  String getStringValue(String key,
      {String value = Locales.FALLBACK_LANGUAGE}) {
    return box.get(key, defaultValue: value);
  }

  Future<void> setStringValue(String key, String value) async {
    return await box.put(key, value);
  }
}
