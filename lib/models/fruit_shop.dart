import 'package:flutter/material.dart';
import 'package:fruit/models/fruit.dart';

class FruitShop extends ChangeNotifier {
  // fruit for sale list
  final List<Fruit> _shop = [
    Fruit(name: 'Banana', price: 30, imagePath: "../../lib/images/banana.png"),
    Fruit(
        name: 'Coconut', price: 50, imagePath: "../../lib/images/coconut.png"),
    Fruit(name: 'Grapes', price: 100, imagePath: "../../lib/images/grapes.png"),
    Fruit(name: 'Orange', price: 25, imagePath: "../../lib/images/orange.png"),
    Fruit(
        name: 'Watermelon',
        price: 150,
        imagePath: "../../lib/images/watermelon.png"),
  ];

  // user cart
  List<Fruit> _userCart = [];

  // get fruit list
  List<Fruit> get fruitShop => _shop;

  // get user cart
  List<Fruit> get userCart => _userCart;

  // add item to cart
  void addItemToCart(Fruit fruit) {
    _userCart.add(fruit);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Fruit fruit) {
    _userCart.remove(fruit);
    notifyListeners();
  }

  // clear cart
  void clearCart() {
    _userCart.clear();
    notifyListeners();
  }
}
