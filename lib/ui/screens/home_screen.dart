// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:easy_localization/easy_localization.dart';

// Project imports:
import 'package:template_app/ui/screens/config_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr('homepage')),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: GestureDetector(
              child: Icon(Icons.settings),
              // onTap: () => context.router.push(
              //   ConfigurationRoute(),
              // ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => (ConfigurationScreen()))),
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
