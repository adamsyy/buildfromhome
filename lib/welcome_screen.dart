import 'login_screen.dart';
import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _auth=FirebaseAuth.instance;

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      body: Container(decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/wall4.jpg"),
              fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: 400,),
                Row(
                  children: <Widget>[
                    Container(
                      height: 60.0,
                    ),

                    Center(
                      child: Text(
                        '         The Hanger',
                        style: GoogleFonts.darkerGrotesque(
                          textStyle: TextStyle(
                              color: Colors.black,letterSpacing: 1,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Colors.black.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () {
                        _auth.signOut();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Log In',style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.black.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(30.0),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        _auth.signOut();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RegistrationScreen();
                        }));
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Register',style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
