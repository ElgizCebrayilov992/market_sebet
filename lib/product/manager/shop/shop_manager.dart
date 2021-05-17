import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../../core/feature/photo/model/photo_model.dart';

class ShopManager extends ChangeNotifier {
  List<PhotoModel> shopPhotoModelItems = [];
  double totalMoney = 0;

  void sumtotalMoney() {
    totalMoney = shopPhotoModelItems.fold(
        0,
        (previousValue, element) =>
            previousValue + element.price * element.count);
    notifyListeners();
  }

  void addShopItem(PhotoModel model) {
    model.count++;
    shopPhotoModelItems.add(model);
    sumtotalMoney();
    notifyListeners();
  }

  void removeShopItem(PhotoModel model) {
    model.count = 0;
    shopPhotoModelItems.remove(model);
    sumtotalMoney();
    notifyListeners();
  }

  void azaltShopItem(PhotoModel model) {
    if (!shopPhotoModelItems.contains(model)) {
      Logger().wtf("Yoxdur");
    } else {
      shopPhotoModelItems
          .singleWhere((element) => element.id == model.id)
          .count--;
      sumtotalMoney();
    }

    notifyListeners();
  }

  void artirShopItem(PhotoModel model) {
    if (!shopPhotoModelItems.contains(model)) {
      Logger().wtf("Yoxdur");
    } else {
      shopPhotoModelItems
          .singleWhere((element) => element.id == model.id)
          .count++;
      sumtotalMoney();
    }

    notifyListeners();
  }
}
