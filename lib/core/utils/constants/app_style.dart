import 'package:flutter/material.dart';

class AppStyle {
  static bgLinearGradient(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        colorScheme.primaryContainer,
        colorScheme.primary,
      ],
    );
  }

  static containerGradient(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        colorScheme.secondaryContainer,
        colorScheme.secondary,
      ],
    );
  }
}
