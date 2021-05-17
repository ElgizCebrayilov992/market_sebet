import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../manager/shop/shop_manager.dart';
import 'package:provider/provider.dart';
import '../../core/feature/photo/model/photo_model.dart';

class PhotoCard extends StatefulWidget {
  final PhotoModel model;

  const PhotoCard({Key? key, required this.model}) : super(key: key);

  @override
  _PhotoCardState createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard>
    with AutomaticKeepAliveClientMixin {
  bool icrementIsOpen = false;
  void isIncrement() {
    if (!icrementIsOpen) {
      context.read<ShopManager>().addShopItem(widget.model);
    } else {
      context.read<ShopManager>().removeShopItem(widget.model);
    }
    setState(() {
      icrementIsOpen = !icrementIsOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Card(
      elevation: 10,
      child: Stack(
        children: [
          ListTile(
            title: Image.network(widget.model.thumbnailUrl ?? ''),
            subtitle: Column(
              children: [
                Text(
                  widget.model.title ?? '',
                  maxLines: 1,
                ),
                IconButton(
                  icon: Icon(Icons.shopping_basket),
                  onPressed: isIncrement,
                ),
              ],
            ),
          ),
          Positioned(
            child: AnimatedContainer(
                height: icrementIsOpen ? context.dynamicHeight(0.13) : 0,
                width: icrementIsOpen ? context.dynamicWidth(0.1) : 0,
                child: buildContainer(),
                duration: context.durationLow),
            right: 0,
          )
        ],
      ),
    );
  }

  Container buildContainer() {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: buildIconButtonPilus(),
          ),
          Expanded(
            flex: 2,
            child: Text(
              widget.model.count.toString(),
            ),
          ),
          Expanded(
            flex: 4,
            child: buildIconButtonMinus(),
          ),
        ],
      ),
      color: Colors.white,
    );
  }

  IconButton buildIconButtonMinus() {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.remove),
      onPressed: () {
        context.read<ShopManager>().azaltShopItem(widget.model);
        //  widget.model.count = widget.model.count - 1;
      },
    );
  }

  IconButton buildIconButtonPilus() {
    return IconButton(
      padding: EdgeInsets.zero,
      icon: Icon(Icons.add),
      onPressed: () {
        context.read<ShopManager>().artirShopItem(widget.model);
        // widget.model.count = widget.model.count + 1;
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
