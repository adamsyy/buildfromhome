import 'package:flutter/material.dart';

class Return  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.black.withOpacity(0.85),),
      body: Center(child: Text('You have not recieved any orders from us yet'),
      ),
    );
  }
}
