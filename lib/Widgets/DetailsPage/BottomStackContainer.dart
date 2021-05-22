import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_shop_app/shoppingcart.dart';

final _auth=FirebaseAuth.instance;
final _firestore=Firestore.instance;
Shoppingcart email1=Shoppingcart();

String pop;
Future<String> showname()async {
  final _user = await _auth.currentUser();
  String x=_user.email;
  print(x);
  return x;

}



//

void  poo()async{
  String pp1=await showname();

  pop=pp1;

}




class BottomStackContainer extends StatelessWidget {
  BottomStackContainer({
    this.title,
    this.price,
    this.img
  });

  final String title;
  final String price;
  final String img;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height *0.4,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            ContainerStackItem(title: title, price: price),
            BottomCart(content: title,amount:price,x: img,pop:pop),
          ],
        ),
      ),
    );
  }
}

class BottomCart extends StatelessWidget {


  String content;
 String amount;
 String x;
 String pop;

 Future<String> getperson()async{
   final _user = await _auth.currentUser();
   String x=_user.email;
   return x;
   print(x);
 }

  BottomCart({this.content,this.amount,this.x,this.pop});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 50,
            width: 50,
            child: Icon(Icons.favorite_border),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), shape: BoxShape.circle),
          ),
          FlatButton.icon(
            onPressed: () async{
                   poo();
                    print(pop);

              print('$content');
             print('$amount');
             _firestore.collection('cart1').add({
               'content':content,
               'amount':amount,
               'image':x,
                'email':pop,
             });


            },
            icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
            label: Text(
              "Add to Basket",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, letterSpacing: 1),
            ),
            color: Colors.pink[100],
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 6,
                vertical: 10),
          )
        ],
      ),
    );
  }
}

class ContainerStackItem extends StatelessWidget {
  ContainerStackItem({
    this.title,
    this.price,
  });

  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ILLUM"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                Text("\$$price",
                    style:
                        TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SIZE"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("16 OZ",
                          style: TextStyle(
                            fontSize: 22,
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("QTY"),
                      SizedBox(
                        height: 5,
                      ),
                      Text("1",
                          style: TextStyle(
                            fontSize: 22,
                          )),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 1.5,
            ),
            ListTile(
              leading: Text(
                "Details",
                style: TextStyle(fontSize: 18),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
            ListTile(
              leading: Text(
                "Shipping & Returns",
                style: TextStyle(fontSize: 18),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ),
            Divider(
              thickness: 1.5,
            ),
          ],
        ),
      ),
    );
  }
}
