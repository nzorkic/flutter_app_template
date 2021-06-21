import 'package:hive_flutter/hive_flutter.dart';
import 'package:template_app/shared/constants/constants.dart';

class HiveUtils {
  bool isDartModeEnabled() {
    Box<bool> box = Hive.box(HiveConfig.SETTINGS_BOX);
    return box.get(HiveConfig.DARK_MODE_ENABLED, defaultValue: false) ?? false;
  }
}
