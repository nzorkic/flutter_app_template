// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:template_app/application/config/app_constants.dart';

class AppTheme {
  /// Colors from Tailwind CSS
  ///
  /// https://tailwindcss.com/docs/customizing-colors
  static const int _primaryColor = 0xFF6366F1;
  static const String _primaryFont = Constants.DEFAULT_FONT;

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

  static final TextTheme _textTheme = TextTheme(
    headline1: TextStyle(
      color: textSwatch.shade700,
      fontWeight: FontWeight.w300,
      fontFamily: _primaryFont,
    ),
    headline2: TextStyle(
      color: textSwatch.shade600,
      fontFamily: _primaryFont,
    ),
    headline3: TextStyle(
      color: textSwatch.shade700,
      fontFamily: _primaryFont,
    ),
    headline4: TextStyle(
      color: textSwatch.shade700,
      fontFamily: _primaryFont,
    ),
    headline5: TextStyle(
      color: textSwatch.shade600,
      fontFamily: _primaryFont,
    ),
    headline6: TextStyle(
      color: textSwatch.shade700,
      fontFamily: _primaryFont,
    ),
    subtitle1: TextStyle(
      color: textSwatch.shade700,
      fontFamily: _primaryFont,
    ),
    subtitle2: TextStyle(
      color: textSwatch.shade600,
      fontFamily: _primaryFont,
    ),
    bodyText1: TextStyle(
      color: textSwatch.shade700,
      fontFamily: _primaryFont,
    ),
    bodyText2: TextStyle(
      color: textSwatch.shade800,
      fontFamily: _primaryFont,
    ),
    button: TextStyle(
      color: textSwatch.shade500,
      fontFamily: _primaryFont,
    ),
    caption: TextStyle(
      color: textSwatch.shade500,
      fontFamily: _primaryFont,
    ),
    overline: TextStyle(
      color: textSwatch.shade500,
      fontFamily: _primaryFont,
    ),
  );

  static final _lightTheme = ThemeData(
    primarySwatch: primarySwatch,
    brightness: Brightness.light,
    scaffoldBackgroundColor: textSwatch.shade100,
    backgroundColor: textSwatch.shade100,
    cardColor: Colors.white,
    bottomAppBarColor: Colors.white,
    dividerColor: const Color(0x1C000000),
    fontFamily: Constants.DEFAULT_FONT,
    textTheme: _textTheme,
  );

  static final _darkTheme = _lightTheme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF24242a),
    backgroundColor: const Color(0xFF24242a),
    cardColor: const Color(0xFF2f2f34),
    bottomAppBarColor: const Color(0xFF35353a),
    dividerColor: const Color(0x1CFFFFFF),
    textTheme: _textTheme.copyWith(
      bodyText2: TextStyle(
        color: textSwatch.shade200,
        fontFamily: Constants.DEFAULT_FONT,
      ),
    ),
  );

  ThemeData getAppThemeData(BuildContext context, bool isDarkModeEnabled) {
    return isDarkModeEnabled ? _darkTheme : _lightTheme;
  }
}
/* AppTheme Notifier */
