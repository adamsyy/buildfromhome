import 'package:flutter/material.dart';
import 'package:my_shop_app/Screens/MyHomePage.dart';
import 'package:my_shop_app/profile.dart';
import 'MyHomePageBody.dart';
import 'package:my_shop_app/shoppingcart.dart';


class MyHomeBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                  blurRadius: 20, color: Colors.grey[300], spreadRadius: 1)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Shoppingcart();
                }));
              },
              icon: Icon(
                Icons.shopping_bag,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MyHomePage();
                }));
              },
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Profile();
                }));
              },
              icon: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainerBottomNav(IconData icon, {isSelected = false}) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.pink[100] : Colors.white,
        shape: BoxShape.circle,
        boxShadow: isSelected
            ? [BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: 1)]
            : [],
      ),
      height: 50,
      width: 50,
      child: Icon(icon, color: isSelected ? Colors.white : Colors.black),
    );
  }
}
