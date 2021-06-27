// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:template_app/ui/screens/home_screen.dart';
import 'package:template_app/ui/screens/settings_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomeScreen,
      initial: true,
    ),
    AutoRoute(
      page: SettingsScreen,
    ),
  ],
)
class $AppRouter {}
