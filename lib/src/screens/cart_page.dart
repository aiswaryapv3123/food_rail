import 'package:flutter/material.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';
import 'package:food_rail/src/widgets/cart/cart_button.dart';
import 'package:food_rail/src/widgets/cart/cart_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context, dividedBy: 30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight(context, dividedBy: 13),
                  ),
                  Text(
                    "Order Summory",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Constants.colors[1],
                        fontFamily: "Exo-Regular"),
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(
                    height: screenHeight(context, dividedBy: 20),
                  ),
                  CartCard(
                    onCountChanged: (val) {
                      setState(() {
                        itemCount = val;
                      });
                      // print("itemcount" + itemCount.toString());
                      print("value" + val.toString());
                    },
                  ),
                  SizedBox(
                    height: screenHeight(context, dividedBy: 5),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Constants.colors[1],
                              fontFamily: "Exo-Regular"),
                        ),
                        Text(
                          "C\$ ${itemCount * 10}",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Constants.colors[1],
                              fontFamily: "Exo-Regular"),
                        ),
                      ]),
                  SizedBox(
                    height: screenHeight(context, dividedBy: 7),
                  ),
                  Text(
                    "Address",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Constants.colors[1],
                        fontFamily: "Exo-Regular"),
                  ),
                  SizedBox(
                    height: screenHeight(context, dividedBy: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Change",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Constants.colors[2],
                            fontFamily: "Exo-Regular"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight(context, dividedBy: 30)),
              child: CartButton(
                label: "PROCEED TO PAYMENT",
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
