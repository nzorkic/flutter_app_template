// Flutter imports:
import 'package:flutter/material.dart';

class SettingTile extends StatelessWidget {
  final String leadingText;
  final Widget trailingWidget;

  const SettingTile({
    Key? key,
    required this.leadingText,
    required this.trailingWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(leadingText),
      trailing: trailingWidget,
    );
  }
}
