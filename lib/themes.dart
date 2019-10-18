import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARK, DARKER, CUSTOM }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.light,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.grey,
    brightness: Brightness.dark,
  );

  static final ThemeData darkerTheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
  );

  static final ThemeData customTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.red,
    toggleableActiveColor: Colors.orange,
    buttonColor: Colors.yellow,
    fontFamily: 'Righteous',
  );
  static final ThemeData limeTheme = ThemeData(
    primarySwatch: Colors.lime,
  );
  static final ThemeData cyanTheme = ThemeData(
    primarySwatch: Colors.cyan,
  );
  static final ThemeData amberTheme = ThemeData(
    primarySwatch: Colors.amber,
  );
  static final ThemeData indigoTheme = ThemeData(
    primarySwatch: Colors.indigo,
  );
  static final ThemeData brownTheme = ThemeData(
    primarySwatch: Colors.brown,
  );
  static final ThemeData greenTheme = ThemeData(
    primarySwatch: Colors.green,
  );
  static final ThemeData pinkTheme = ThemeData(
    primarySwatch: Colors.pink,
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      case MyThemeKeys.DARKER:
        return darkerTheme;
      case MyThemeKeys.CUSTOM:
        return customTheme;
      default:
        return lightTheme;
    }
  }
}
