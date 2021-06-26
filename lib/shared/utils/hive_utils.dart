import 'package:hive_flutter/hive_flutter.dart';

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
}
