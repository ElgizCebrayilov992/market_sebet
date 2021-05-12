import 'package:flutter/material.dart';
import 'package:market_sebet/core/theme_light.dart';

import 'core/feature/tabbar/app_tabbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LightTheme.instance.data,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: AppTabBar(),
    );
  }
}
