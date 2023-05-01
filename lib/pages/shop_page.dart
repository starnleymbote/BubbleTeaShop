import 'package:flutter/material.dart';
import 'package:milk_tea/components/drink_tile.dart';
import 'package:milk_tea/models/drink.dart';
import 'package:milk_tea/pages/order_page.dart';
import 'package:provider/provider.dart';

import '../models/tea_shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //User want to to order the selected drink
  void goToOrderPage(Drink drink) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => OrderPage(drink: drink)));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TeaShop>(
        builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Heading
                    Text(
                      "Milk Tea Shop",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 21),
                    ),

                    SizedBox(height: 15),
                    //list of Drinks
                    Expanded(
                      child: ListView.builder(
                          itemCount: value.shop.length,
                          itemBuilder: (context, index) {
                            //Get individual drinks
                            Drink individualDrink = value.shop[index];

                            //Display the individual drink in a card
                            return DrinkTile(
                              drink: individualDrink,
                              onTap: () => goToOrderPage(individualDrink),
                              trailing: Icon(Icons.arrow_forward),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ));
  }
}
