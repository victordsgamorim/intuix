import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformInfo {
  static const _desktopPlatforms = [
    TargetPlatform.macOS,
    TargetPlatform.windows,
    TargetPlatform.linux
  ];
  static const _mobilePlatforms = [
    TargetPlatform.android,
    TargetPlatform.iOS,
  ];

  static bool get isDesktop =>
      _desktopPlatforms.contains(defaultTargetPlatform) && !kIsWeb;

  static bool get isDesktopOrWeb => isDesktop || kIsWeb;

  static bool get isMobile =>
      _mobilePlatforms.contains(defaultTargetPlatform) && !kIsWeb;

  static bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;

  static bool get isLinux => defaultTargetPlatform == TargetPlatform.linux;

  static bool get isMacOS => defaultTargetPlatform == TargetPlatform.macOS;

  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  static bool isPhoneSize(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTabletSize(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 960;

  static bool isMobileSize(BuildContext context) =>
      isPhoneSize(context) || isTabletSize(context);

  static bool isDesktopOrWebSize(BuildContext context) =>
      MediaQuery.of(context).size.width >= 960;
}
