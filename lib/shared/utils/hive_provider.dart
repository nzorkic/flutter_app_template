import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final settingsBoxProvider = Provider<Box>((ref) {
  throw UnimplementedError();
});

final hiveUtilsProvider = Provider<HiveUtils>((ref) {
  final _hive = ref.watch(settingsBoxProvider);
  return HiveUtils(box: _hive);
});

class HiveUtils {
  HiveUtils({
    required this.box,
  });

  final Box box;

  bool isDarkModeEnabled() {
    return box.get('isDarkModeEnabled', defaultValue: false);
  }

  Future<void> setDarkModeEnabled(bool value) async {
    return await box.put('isDarkModeEnabled', value);
  }
}
