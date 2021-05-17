import 'package:flutter/material.dart';
import 'package:market_sebet/product/manager/shop/shop_manager.dart';
import 'package:market_sebet/product/widget/card_shop.dart';
import 'package:provider/provider.dart';

class BasketView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<ShopManager>().shopPhotoModelItems.isEmpty
          ? Text('Basket is empty')
          : ListView.builder(
              itemCount:
                  context.watch<ShopManager>().shopPhotoModelItems.length,
              itemBuilder: (context, index) {
                return PhotoCard(
                  model:
                      context.watch<ShopManager>().shopPhotoModelItems[index],
                );
              },
            ),
    );
  }
}
