

import 'package:flutter/material.dart';
import 'package:market_sebet/core/feature/photo/viewmodel/photo_view_model.dart';

final _viewModel=PhotosViewModel();
class PhotosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ActionChip(
            avatar: Icon(Icons.shopping_bag),
            label: Text('\$10'), 
            onPressed: (){},
            ),
            ],
      ),
      body: GridView.builder(
        itemCount: _viewModel.photos.length,
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
       itemBuilder: (context, index) {
         return Card(
           
                    child: ListTile(
            title: Image.network(_viewModel.photos[index].thumbnailUrl??''),
             subtitle: Text(_viewModel.photos[index].title??''),
           ),
         );
       },),
    );
  }
}
