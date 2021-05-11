

import 'package:flutter/material.dart';

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
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
       itemBuilder: (context, index) {
         return Text('data');
       },),
    );
  }
}
