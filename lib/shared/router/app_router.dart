// Package imports:
import 'package:auto_route/auto_route.dart';

// Project imports:
import 'package:template_app/ui/screens/config_screen.dart';
import 'package:template_app/ui/screens/home_screen.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: HomeScreen,
      initial: true,
    ),
    AutoRoute(
      page: ConfigurationScreen,
    ),
  ],
)
class $AppRouter {}
