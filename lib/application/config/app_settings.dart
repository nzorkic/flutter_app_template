abstract class Settings {
  Settings._();
  static const String DEFAULT_FONT = 'Poppins';

  static const Map<String, String> LOCALES = {
    'en': 'English',
    'rs': 'Srpski',
  };
  static const String FALLBACK_LANGUAGE = 'en';
  static const String TRANSLATIONS_PATH = 'assets/translations';
}
