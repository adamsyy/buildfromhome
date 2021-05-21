import 'package:flutter/material.dart';

import '../../Screens/DetailsPage.dart';
import 'package:my_shop_app/Myhomepage2.dart';
import 'package:my_shop_app/myhomepage3.dart';

import 'Screens/MyHomePage.dart';
import 'profile.dart';

class MyHomePageBody2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [HeadingTopBar(), BottomBodyContainer()],
    );
  }
}

class BottomBodyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                spreadRadius: 1,
                blurRadius: 20,
              ),
            ]),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              HeadingText(),
              MyCandelsList(),
              SizedBox(
                height: 20,
              ),
              LineBar(),
              BottomBodyItems(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBodyItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            children: [
              Text(
                "Cheapest Deals",
                style: TextStyle(fontSize: 24),
              ),
              Spacer(),
              Text(
                "View All",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Bottomileitems(
                x: 15,
                text: 'Mens Hankerchief',
                price: 08,
                idk:11,
              ),
              Bottomileitems(
                x: 16,
                text: 'Cotton Loafers',
                price:07,
                idk: 20,
              ),
              Bottomileitems(
                x: 17,
                text: 'Nike React Shorts',
                price: 12,
                idk: 22,
              ),

            ],
          ),
        )
      ],
    );
  }

  Container buildbottomContainer() {
    return Container(
      height: 150,
      width: 230,
      margin: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                  height: 120,
                  width: 99,
                  child: Image.asset(
                    "assets/images/candel3.jpg",
                    fit: BoxFit.cover,
                  ))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Coconut Milk Bath"),
                Text(
                  "16 oz",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Spacer(),
                Text(
                  "\$ 28",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildColumnAtTop("Trending", isSelected: true),
            buildColumnAtTop("Indoor"),
            buildColumnAtTop("Formal"),
            buildColumnAtTop("Local"),
            buildColumnAtTop("Casual"),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Column buildColumnAtTop(String text, {bool isSelected = false}) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        if (isSelected)
          Container(
            height: 5,
            width: 5,
            decoration:
            BoxDecoration(color: Colors.black, shape: BoxShape.circle),
          )
      ],
    );
  }
}

class HeadingTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Text(
              "Weber ",
              style: TextStyle(fontSize: 32, letterSpacing: 1),
            ),
            Text(
              "Hanger",
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: 1),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Pinkbutton(
              text: "Clothing",
              isSelected: false,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyHomePage();
                }));
              },
            ),
            Pinkbutton(
              text: "Accesories",
              isSelected: true,
              onPressed: () {

              },
            ),
            Pinkbutton(
              text: "Extras",
              isSelected: false,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return MyHomePage3();}));
              },
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class MyCandelsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          buildColumnWithRow("11", "Kyco Smartwatch", "99", context),
          buildColumnWithRow("12", "Skagen Mens watch", "139", context),
          buildColumnWithRow("13", "Dyme Necklace", "40", context),
          buildColumnWithRow("14", "Mature Bag", "60", context),

        ],
      ),
    );
  }

  GestureDetector buildColumnWithRow(
      String img, String title, String price, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailsPage(
            title: title,
            img: img,
            context: context,
            price: price,
          );
        }));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 220,
              width: 160,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/candel$img.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "\$ $price",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class LineBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    return Container(
      height: 5,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 40),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Container(
        height: 5,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

class Bottomileitems extends StatelessWidget {
  int x;
  String text;
  int price;
  int idk;
  Bottomileitems({this.x, this.text, this.price, this.idk});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return DetailsPage(
          title: text,
          price: price.toString(),
          context: context,
          img: x.toString(),
        );
      }));
    },
      child: Container(
        height: 150,
        width: 230,
        margin: EdgeInsets.only(left: 20),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: SizedBox(
                    height: 120,
                    width: 99,
                    child: Image.asset(
                      "assets/images/candel$x.jpg",
                      fit: BoxFit.cover,
                    ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text),
                  Text(
                    "$idk oz",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  Spacer(),
                  Text(
                    "\$ $price",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Pinkbutton extends StatelessWidget {
  String text;
  bool isSelected = false;
  Function onPressed;

  Pinkbutton({this.text, this.isSelected, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 18,
        ),
      ),
      shape: StadiumBorder(),
      color: isSelected ? Colors.pink[100] : Colors.grey[300],
    );
  }
}
