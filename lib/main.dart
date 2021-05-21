import 'package:flutter/material.dart';
import 'package:my_shop_app/Myhomepage2.dart';
import 'package:my_shop_app/profile.dart';
import 'package:my_shop_app/welcome_screen.dart';

import 'Screens/MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }

}

