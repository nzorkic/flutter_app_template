// Flutter imports:
import 'package:flutter/material.dart';

class DropDownSelector extends StatelessWidget {
  final String value;
  final List<String> items;
  final void Function(String) onChangeFn;

  const DropDownSelector({
    Key? key,
    required this.value,
    required this.items,
    required this.onChangeFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: value,
      icon: const Icon(Icons.arrow_downward),
      dropdownColor: Theme.of(context).backgroundColor,
      items: items.map(
        (String optionText) {
          return DropdownMenuItem(
            child: Text(
              optionText,
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText2!.color),
            ),
            value: optionText,
          );
        },
      ).toList(),
      onChanged: (val) => onChangeFn(val.toString()),
    );
  }
}
