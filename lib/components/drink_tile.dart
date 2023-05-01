import 'package:flutter/material.dart';

import '../models/drink.dart';

class DrinkTile extends StatelessWidget {
  final Drink drink;
  void Function() onTap;
  final Widget trailing;

  DrinkTile(
      {Key? key,
      required this.drink,
      required this.onTap,
      required this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
            color: Colors.brown.shade100,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(drink.name),
          subtitle: Text(drink.price),
          leading: Image.asset(drink.imagePath),
          trailing: this.trailing,
        ),
      ),
    );
  }
}
