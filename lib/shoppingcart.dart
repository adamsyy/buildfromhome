import 'package:flutter/material.dart';

import 'Widgets/HomePage/BottomNavigationBar.dart';

class Shoppingcart extends StatefulWidget {
  @override
  _ShoppingcartState createState() => _ShoppingcartState();
}

class _ShoppingcartState extends State<Shoppingcart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: Text(
          'Shopping Cart',
          style: TextStyle(color: Colors.black, fontSize: 23),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.all(10),
            child: Image.asset("assets/images/SEARCH.png"),
          ),
        ],
      ),
      bottomNavigationBar: MyHomeBottomNavBar(),
    );
  }
}
