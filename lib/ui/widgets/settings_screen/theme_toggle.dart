// Flutter imports:
import 'package:flutter/material.dart';

class ThemeToggle extends StatelessWidget {
  final bool isDarkMode;
  final void Function(BuildContext) onChangedFn;

  const ThemeToggle({
    Key? key,
    required this.isDarkMode,
    required this.onChangedFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isDarkMode ? Icons.dark_mode : Icons.light_mode,
          color: Colors.yellow[700],
        ),
        Switch(
          value: isDarkMode,
          onChanged: (_) => onChangedFn(context),
        ),
      ],
    );
  }
}
