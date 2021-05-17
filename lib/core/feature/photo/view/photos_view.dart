import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:market_sebet/product/manager/shop/shop_manager.dart';
import 'package:provider/provider.dart';

import '../../../../product/widget/card_shop.dart';
import '../viewmodel/photo_view_model.dart';

final _viewModel = PhotosViewModel();

class PhotosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: buildObserverIsLoading(),
        actions: [
          buildActionChip(context),
        ],
      ),
      body: buildGridView(),
    );
  }

  Observer buildObserverIsLoading() {
    return Observer(builder: (_) {
      return Visibility(
        child: CircularProgressIndicator(),
        visible: _viewModel.isLoading,
      );
    });
  }

  ActionChip buildActionChip(BuildContext context) {
    return ActionChip(
      avatar: Icon(Icons.shopping_bag),
      label: Text('\$${context.watch<ShopManager>().totalMoney}'),
      onPressed: () {},
    );
  }

  Widget buildGridView() {
    return Observer(builder: (_) {
      return GridView.builder(
        itemCount: _viewModel.photos.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        itemBuilder: (context, index) {
          return PhotoCard(model: _viewModel.photos[index]);
        },
      );
    });
  }
}
