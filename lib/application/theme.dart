// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:template_app/shared/constants/settings.dart';

class AppTheme {
  /// Colors from Tailwind CSS
  ///
  /// https://tailwindcss.com/docs/customizing-colors
  static const int _primaryColor = 0xFF6366F1;
  static const MaterialColor primarySwatch =
      MaterialColor(_primaryColor, <int, Color>{
    50: Color(0xFFECEDFD),
    100: Color(0xFFD0D1FB),
    200: Color(0xFFB1B3F8),
    300: Color(0xFF9294F5),
    400: Color(0xFF7A7DF3),
    500: Color(_primaryColor),
    600: Color(0xFF5B5EEF),
    700: Color(0xFF5153ED),
    800: Color(0xFF4749EB),
    900: Color(0xFF3538E7),
  });

  static const int _textColor = 0xFF6B7280;
  static const MaterialColor textSwatch =
      MaterialColor(_textColor, <int, Color>{
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF3F4F6),
    200: Color(0xFFE5E7EB),
    300: Color(0xFFD1D5DB),
    400: Color(0xFF9CA3AF),
    500: Color(_textColor),
    600: Color(0xFF4B5563),
    700: Color(0xFF374151),
    800: Color(0xFF1F2937),
    900: Color(0xFF111827),
  });

  static final _lightTheme = ThemeData(
    primarySwatch: primarySwatch,
    brightness: Brightness.light,
    scaffoldBackgroundColor: textSwatch.shade100,
    backgroundColor: textSwatch.shade100,
    cardColor: Colors.white,
    bottomAppBarColor: Colors.white,
    dividerColor: const Color(0x1C000000),
    fontFamily: Config.DEFAULT_FONT,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: textSwatch.shade700,
        fontWeight: FontWeight.w300,
      ),
      headline2: TextStyle(
        color: textSwatch.shade600,
      ),
      headline3: TextStyle(
        color: textSwatch.shade700,
      ),
      headline4: TextStyle(
        color: textSwatch.shade700,
      ),
      headline5: TextStyle(
        color: textSwatch.shade600,
      ),
      headline6: TextStyle(
        color: textSwatch.shade700,
      ),
      subtitle1: TextStyle(
        color: textSwatch.shade700,
      ),
      subtitle2: TextStyle(
        color: textSwatch.shade600,
      ),
      bodyText1: TextStyle(
        color: textSwatch.shade700,
      ),
      bodyText2: TextStyle(
        color: textSwatch.shade500,
      ),
      button: TextStyle(
        color: textSwatch.shade500,
      ),
      caption: TextStyle(
        color: textSwatch.shade500,
      ),
      overline: TextStyle(
        color: textSwatch.shade500,
      ),
    ),
  );

  static final _darkTheme = _lightTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF24242a),
    backgroundColor: const Color(0xFF24242a),
    cardColor: const Color(0xFF2f2f34),
    bottomAppBarColor: const Color(0xFF35353a),
    dividerColor: const Color(0x1CFFFFFF),
    textTheme: _lightTheme.textTheme.apply(fontFamily: Config.DEFAULT_FONT),
  );

  ThemeData getAppThemeData(BuildContext context, bool isDarkModeEnabled) {
    return isDarkModeEnabled ? _darkTheme : _lightTheme;
  }
}
/* AppTheme Notifier */


