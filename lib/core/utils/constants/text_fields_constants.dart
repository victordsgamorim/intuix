import 'package:flutter/material.dart';

class TextFormFieldStyle {
  static String obscuringCharacter = '●';

  static Color fontColor(BuildContext context) =>
      Theme.of(context).colorScheme.onSecondaryContainer;

  static Color cursorColor(BuildContext context) =>
      Theme.of(context).colorScheme.onSecondaryContainer;

}
