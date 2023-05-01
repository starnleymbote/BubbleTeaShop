import 'package:flutter/material.dart';
import 'package:milk_tea/models/tea_shop.dart';
import 'package:provider/provider.dart';

import '../models/drink.dart';

class OrderPage extends StatefulWidget {
  final Drink drink;
  const OrderPage({Key? key, required this.drink}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  //Initial sweet value
  double sweetValue = 0.0;
  double iceValue = 0.0;
  double pearlValue = 0.0;

  //customize sweetness
  void customizeSweet(double newValue) {
    setState(() {
      sweetValue = newValue;
    });
  }

  //customize Ice
  void customizeIce(double newValue) {
    setState(() {
      iceValue = newValue;
    });
  }

  //customize Pearls
  void customizePearls(double newValue) {
    setState(() {
      pearlValue = newValue;
    });
  }

  //Add to cart
  void addToCart() {
    Provider.of<TeaShop>(context, listen: false).addToCart(widget.drink);

    Navigator.pop(context);

    //Show dialog that all was well
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("${widget.drink.name} was added to cart successfully"),
        backgroundColor: Colors.brown.shade100,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.drink.name),
        backgroundColor: Colors.brown,
      ),
      backgroundColor: Colors.brown.shade200,
      body: Column(
        children: [
          //Image of the drink
          Image.asset(
            widget.drink.imagePath,
          ),

          //Slider to customize the drink
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                //Sweetness slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Text("Sweetness"),
                    ),
                    Expanded(
                      child: Slider(
                          value: sweetValue,
                          divisions: 10,
                          label: sweetValue.toString(),
                          onChanged: (value) => customizeSweet(value)),
                    )
                  ],
                ),

                //Ice slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 80,
                      child: Text("Ice"),
                    ),
                    Expanded(
                      child: Slider(
                          value: iceValue,
                          divisions: 10,
                          label: iceValue.toString(),
                          onChanged: (value) => customizeIce(value)),
                    )
                  ],
                ),

                //pearls slider
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 80, child: Text("Pearls")),
                    Expanded(
                      child: Slider(
                          value: pearlValue,
                          divisions: 10,
                          label: pearlValue.toString(),
                          onChanged: (value) => customizePearls(value)),
                    )
                  ],
                ),

                MaterialButton(
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.brown,
                    onPressed: () => addToCart())
              ],
            ),
          ),
          //Add to cart
        ],
      ),
    );
  }
}
