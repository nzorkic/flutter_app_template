import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:template_app/shared/router/app_router.gr.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              child: Icon(Icons.settings),
              onTap: () => context.router.push(
                ConfigurationRoute(),
              ),
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
            SizedBox(
              height: 30,
            ),
            Text(
              tr('greeting'),
              style: TextStyle(
                fontSize: 18.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
