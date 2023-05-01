import 'package:flutter/cupertino.dart';

import 'drink.dart';

class TeaShop extends ChangeNotifier {
  //list of all drinks for sale
  final List<Drink> _shop = [
    Drink(name: "Carmel Tea", price: "120", imagePath: "images/milk_tea.jpg"),
  ];

  //list all drinks in users cart
  final List<Drink> _userCart = [];

  //get drinks for sale
  List<Drink> get shop => _shop;

  //get user cart
  List<Drink> get cart => _userCart;

  //Add drinks to the cart
  void addToCart(Drink drink) {
    _userCart.add(drink);
    notifyListeners();
  }

  //Remove drink from the cart
  void removeFromCart(Drink drink) {
    _userCart.remove(drink);
    notifyListeners();
  }
}
