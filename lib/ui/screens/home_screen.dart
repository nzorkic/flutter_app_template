// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:template_app/application/logging/log_pens.dart';
import 'package:template_app/application/logging/logger_types.dart';
import 'package:template_app/shared/router/app_router.gr.dart';

class HomeScreen extends StatelessWidget with UiLogger {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.info(penInfo('Build started...'));
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('homepage_title')),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              child: Icon(Icons.settings),
              onTap: () => context.pushRoute(SettingsRoute()),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/bird.png',
              width: 350,
              height: 150,
            ),
            SizedBox(height: 30),
            Text(
              tr('greeting'),
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
      ),
    );
  }
}
