import 'package:flutter/material.dart';
import 'package:milk_tea/components/drink_tile.dart';
import 'package:milk_tea/models/drink.dart';
import 'package:milk_tea/models/tea_shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    //delete drink from cart
    void removeDrinkFromCart(Drink drink) {
      Provider.of<TeaShop>(context, listen: false).removeFromCart(drink);
    }

    return Consumer<TeaShop>(
        builder: (context, value, index) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    //Title of the page
                    Text(
                      "My Cart",
                      style: TextStyle(fontSize: 22),
                    ),

                    SizedBox(height: 15),
                    //List of items in the cart
                    Expanded(
                      child: ListView.builder(
                          itemCount: value.cart.length,
                          itemBuilder: (context, index) {
                            //get individual drink in the cart
                            Drink drink = value.cart[index];

                            return DrinkTile(
                                drink: drink,
                                onTap: () => removeDrinkFromCart(drink),
                                trailing: Icon(Icons.delete_forever));
                          }),
                    ),
                    MaterialButton(
                        color: Colors.brown,
                        child: Text(
                          "Check Out",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        onPressed: () => {}),

                    //Check out button
                  ],
                ),
              ),
            ));
  }
}
