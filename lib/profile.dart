import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_shop_app/welcome_screen.dart';
import 'login_screen.dart';
import 'package:my_shop_app/Widgets/HomePage/BottomNavigationBar.dart';
import 'registration_screen.dart' as registrationscreenimport;

final _auth = FirebaseAuth.instance;
registrationscreenimport.RegistrationScreen email1=registrationscreenimport.RegistrationScreen();


registrationscreenimport.RegistrationScreen email2=registrationscreenimport.RegistrationScreen();
String pop="To Weber Hanger";

Future<String> showname()async {
  final _user = await _auth.currentUser;
  String x=_user.email;
   print(x);

  if(x!=null) {
    List<String> y = [];
    y = x.split('@');

    String z = y[0];
    String xyz = z.substring(0, 1).toUpperCase() + z.substring(1);

    return xyz;
  }
}



//

void  poo()async{
 String pp1=await showname();

 pop=pp1;

}




class Profile extends StatefulWidget {


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

@override
  void initState(){

    super.initState();

    poo();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], appBar: AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.grey[200],
      elevation: 0,
      leading: Image.asset("assets/images/hamburger.png"),
      actions: [
        Container(
          decoration: BoxDecoration(

            shape: BoxShape.circle,
          ),
          margin: EdgeInsets.all(10),
          child: GestureDetector(child: Icon(Icons.design_services_outlined,color: Colors.black,size: 35,),onTap: (){

            _auth.signOut();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return WelcomeScreen();
                }));
          },),
        ),
      ],
    ),
      // appBar: AppBar(automaticallyImplyLeading: false,
      //   toolbarHeight: 70,
      //   backgroundColor: Colors.grey[200],
      //   elevation: 8,title: Text('Weber Maadakada',style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.w900),),
      //   actions: [
      //     Container(
      //       decoration: BoxDecoration(
      //
      //         shape: BoxShape.circle,
      //       ),
      //       margin: EdgeInsets.all(10),
      //       child:Icon(FontAwesomeIcons.signature,color: Colors.pink[200],),
      //     ),
      //   ],
      // ),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 200),
                child: Text(
                  ' Welcome',
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 35,
                      fontWeight: FontWeight.w100),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                ' $pop',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Divider(

            thickness: 1,
            height: 1,
          ),
          Cardprofile(text: 'View your cart'),

          Cardprofile(text: 'Home'),
          Cardprofile(
            text: 'Returns',
          ),
          Cardprofile(text: 'Contact us'),
        ],
      ),
      bottomNavigationBar: MyHomeBottomNavBar(),
    );
  }
}

//
// String x=email1.sendemail();
// List<String> y=[];
// y=x.split('@');
// String z=y[0];
// String xyz=z.substring(0,1).toUpperCase()+z.substring(1);
//
//
// print('$xyz');

class Cardprofile extends StatelessWidget {
  String text;
  Cardprofile({this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Container(
        child: Center(
            child: Text(
          '$text',
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w100,
              fontStyle: FontStyle.italic),
        )),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            )
          ],
        ),
        height: 100,
        width: 350,
      ),
    );
  }
}
