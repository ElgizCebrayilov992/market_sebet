import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/feature/tabbar/app_tabbar.dart';
import 'core/theme_light.dart';
import 'product/manager/shop/shop_manager.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<ShopManager>(create: (context) => ShopManager(),)
  ],child: MyApp(),));
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