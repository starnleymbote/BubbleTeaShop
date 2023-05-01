import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;

  BottomNavBar({Key? key, required this.onTabChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: GNav(
          onTabChange: (value) => onTabChange!(value),
          mainAxisAlignment: MainAxisAlignment.center,
          activeColor: Colors.white,
          color: Color(0xFFE0E0E0),
          tabActiveBorder: Border.all(color: Colors.white),
          tabs: [
            //Shop tabs
            GButton(
              icon: Icons.home,
              text: "Shop",
            ),

            //Cart tabs
            GButton(
              icon: Icons.shopping_cart,
              text: "Cart",
            ),
          ]),
    );
  }
}
