import 'package:my_shop_app/Screens/MyHomePage.dart';

import 'login_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

final _auth = FirebaseAuth.instance;
String email='';
String password='';





class RegistrationScreen extends StatefulWidget {

  Future<String> shownames()async {
    final _user = await _auth.currentUser;
    String x=_user.email;

    print(x);
    if(x!=null) {
      List<String> y = [];
      y = x.split('@');
      print(y);
      String z = y[0];
      String xyz = z.substring(0, 1).toUpperCase() + z.substring(1);

      return xyz;
    }
  }
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/wall3.jpg"),
              fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 200.0,
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(hintStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w100,fontStyle: FontStyle.italic),
                  hintText: 'Enter your email',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(style: TextStyle(color: Colors.black),
                onChanged: (value) {
                  password = value;
                },
                decoration: InputDecoration(hintStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w100,fontStyle: FontStyle.italic),
                  hintText: 'Enter your password',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.black.withOpacity(0.75),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      final newuser = await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);

                      if(newuser!=null){

                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                      return MyHomePage();
                      }));
                      }
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
