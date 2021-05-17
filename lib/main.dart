import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/feature/tabbar/app_tabbar.dart';
import 'core/theme_light.dart';
import 'product/manager/shop/shop_manager.dart';

Future<void> main() async {
  final langPath = 'assets/lang';
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ShopManager>(
        create: (context) => ShopManager(),
      )
    ],
    child: EasyLocalization(
        supportedLocales: [
          Locale('en', 'US'),
          Locale('tr', 'TR'),
          Locale('az', 'AZ'),
        ],
        path: langPath, // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: LightTheme.instance.data,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: AppTabBar(),
    );
  }
}
