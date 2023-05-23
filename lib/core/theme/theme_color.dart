import 'package:flutter/material.dart';

class ThemeColor {
  // https://coolors.co/fff3e8-fee0c9-fdc2a7-fca289-fb9e5c-f07936-d8541f-b93a13-91270b-6b1b08

  static MaterialColor primary = const MaterialColor(0xfffb9e5c, {
    50: Color(0xfffff3e8),
    100: Color(0xfffee0c9),
    200: Color(0xfffdc2a7),
    300: Color(0xfffca289),
    400: Color(0xfffb9e5c),
    500: Color(0xfffb9e5c),
    600: Color(0xfff07936),
    700: Color(0xffd8541f),
    800: Color(0xffb93a13),
    900: Color(0xff91270b),
  });

  // https://coolors.co/e2d1fc-c3a3f9-a576f6-8549f3-7130e7-5a27c9-4323ab-2c1f8d-151b6f-00094f
  static MaterialColor background = const MaterialColor(0xff7130E7, {
    50: Color(0xffe2d1fc),
    100: Color(0xffc3a3f9),
    200: Color(0xffa576f6),
    300: Color(0xff8549f3),
    400: Color(0xff7130e7),
    500: Color(0xff5a27c9),
    600: Color(0xff4323ab),
    700: Color(0xff2c1f8d),
    800: Color(0xff151b6f),
    900: Color(0xff00094f),
  });
}
