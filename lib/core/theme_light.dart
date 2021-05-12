import 'package:flutter/material.dart';

import 'ITheme.dart';

class LightTheme extends ITheme {
  static LightTheme? _instace;
  static LightTheme get instance {
    if (_instace != null) return _instace!;
    _instace = LightTheme._init();
    return _instace!;
  }

  LightTheme._init();
  final ThemeData _lightTheme = ThemeData.light();
  @override
  ThemeData get data => ThemeData(
        accentColor: Colors.green,
        textTheme: _lightTheme.textTheme.apply(bodyColor: colors.lynch),
        appBarTheme: _lightTheme.appBarTheme.copyWith(
            backgroundColor: Colors.white70,
            textTheme: _lightTheme.textTheme.apply(bodyColor: colors.lynch)),
        colorScheme: _lightTheme.colorScheme.copyWith(
            primary: Colors.white70,
            onPrimary: colors.lynch,
            onSecondary: colors.castSkillWhite),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.black,
          unselectedLabelColor: colors.bitterSweet,
        ),
      );
}
