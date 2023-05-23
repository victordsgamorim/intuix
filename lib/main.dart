import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizz/app_widget.dart';
import 'package:quizz/core/injection/injection.dart';

import 'common_dependencies.dart';

void main() {
  registerDependencies();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const QuizzApp(), // Wrap your app
  ));
}

final bubbleLogic = GetIt.I<BubbleLogic>();


