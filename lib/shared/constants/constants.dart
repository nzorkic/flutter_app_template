class Config {
  static const String MAIN_FONT = 'Poppins';
}

class HiveBoxes {
  static const String SETTINGS_BOX = 'settings';
}

class HiveKeys {
  // SETTINGS_BOX
  static const String DARK_MODE_ENABLED = 'darkModeEnabled';
  static const String CURRENT_LANGUAGE = 'language';
}

class Locales {
  static const Map<String, String> LOCALES = {
    'en': 'English',
    'rs': 'Serbian',
  };
  static const String FALLBACK_LANGUAGE = 'en';
  static const String PATH = 'assets/translations';
}
