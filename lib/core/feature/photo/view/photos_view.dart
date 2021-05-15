import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
          buildActionChip(),
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

  ActionChip buildActionChip() {
    return ActionChip(
      avatar: Icon(Icons.shopping_bag),
      label: Text('\$10'),
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
