import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:market_sebet/core/feature/basket/basket_view.dart';
import 'package:market_sebet/core/init/lang/local.keys.g.dart';

import '../photo/view/photos_view.dart';
import 'model/tabbar_model.dart';

class AppTabBar extends StatelessWidget {
  final List<TabModel> tabsItem = [
    TabModel(
      title: LocalKeys.tabBar_home,
      icon: Icons.ac_unit,
      page: PhotosView(),
    ),
    TabModel(
      title: LocalKeys.tabBar_basket,
      icon: Icons.accessibility_outlined,
      page: BasketView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: buildTabBar(),
        ),
        body: buildTabBarView(),
      ),
    );
  }

  TabBar buildTabBar() {
    return TabBar(
      tabs: List.generate(
        tabsItem.length,
        (index) => Tab(
          text: tabsItem[index].title.tr(),
          icon: Icon(tabsItem[index].icon),
        ),
      ),
    );
  }

  TabBarView buildTabBarView() => TabBarView(
        children: tabsItem.map((e) => e.page).toList(),
      );
}
