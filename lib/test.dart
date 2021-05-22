import 'package:flutter/material.dart';

import 'Widgets/HomePage/BottomNavigationBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class test extends StatefulWidget {

  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  final _auth = FirebaseAuth.instance;
  String pop='';
  Future<String> showname()async {
    final _user =  _auth.currentUser;
    String x=_user.email;
    print(x);
    return x;

  }



//

  void  poo()async{
    String pp1=await showname();

    pop=pp1;

  }



  @override
  void initState() {

    super.initState();
    poo();
  }

  final  _firestore =FirebaseFirestore.instance;


  Future<String> showuid()async {
    final _user = await _auth.currentUser;
    String x=_user.uid;
    return x;

  }


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
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: _firestore.collection('cart1').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.pinkAccent,
                    ),
                  );
                }
                final messages = snapshot.data.docs;
                List<MessageBubble> messageBubbles = [];
                for (var message in messages) {
                  final messagecontent = message.data()['content'];
                  final messageamount = message.data()['amount'];
                  final messageimage = message.data()['image'];
                  final messageBubble = MessageBubble(
                      content: messagecontent,
                      amount: messageamount,
                      image:messageimage
                  );
                  messageBubbles.add(messageBubble);
                }
                return Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    children: messageBubbles,
                  ),
                );
              }),
        ],
      ),
      bottomNavigationBar: MyHomeBottomNavBar(),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String content;
  final String amount;
  final String image;

  MessageBubble({this.content, this.amount,this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(10.0),
      child: Column(
        children: [Image.asset(
          "assets/images/candel$image.jpg",

        ),
          Material(elevation: 5,borderRadius:BorderRadius.circular(30),
              color: Colors.pinkAccent.withOpacity(0.7), child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Text('$content costing  $amount Dollars'),
              )),
        ],
      ),
    );
  }
}
