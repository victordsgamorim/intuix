import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:quizz/core/route/route.dart';
import 'package:quizz/core/theme/app_theme.dart';

class QuizzApp extends StatelessWidget {
  const QuizzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      routerConfig: router,
    );
  }
}
