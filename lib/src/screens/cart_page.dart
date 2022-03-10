import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_rail/src/api/services.dart';
import 'package:food_rail/src/bloc/category_list_bloc.dart';
import 'package:food_rail/src/models/get_products.dart';
import 'package:food_rail/src/screens/explore_menu_page.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';
import 'package:food_rail/src/widgets/cart/cart_button.dart';
import 'package:food_rail/src/widgets/cart/cart_card.dart';

class CartPage extends StatefulWidget {
  final List<Product> products;
  const CartPage({Key key, this.products}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<int> itemCount = [];
  List<double> itemPrice = [];
  double totalPrice = 0;
  double totalAmount = 0;
  double cartAmount = 0;
  List<double> amount = [];
  double sum = 0;
  List<Product> food =[];

  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < widget.products.length; i++) {
      setState(() {
        cartAmount = cartAmount + double.parse(widget.products[i].price);
        itemCount.add(1);
        amount.add(double.parse(widget.products[i].price));
        itemPrice.add(double.parse(widget.products[i].price));
        food.add(widget.products[i]);
      });
      print("Price list");
      print(itemPrice);
      print("Count list");
      print(itemCount);
      print("Cart Initiay");
      print(cartAmount);
    }
    super.initState();
  }

  totalAmountCalculate(List<int> itemCount, List<double> itemPrice) {
    for (int i = 0; i < itemCount.length; i++) {
      setState(() {
        amount[i] = (itemCount[i] * itemPrice[i]);
        total(amount);
        print(itemCount[i].toString() +
            " * " +
            itemPrice[i].toString() +
            " = " +
            amount[i].toString());
        print("CartAmount");
        print(cartAmount);
      });
    }
  }

  total(List<double> amount) {
    print("amount list");
    for (int i = 0; i < amount.length; i++) {
      setState(() {
        // cartAmount= cartAmount+amount[i];
        sum = sum + amount[i];
        print(amount[i]);
      });
    }
    print("Sum " + sum.toString());
  }

  Future<bool> onWillPopCall (){
    push(context, BlocProvider(
        create: (context) => CategoryListBloc(foodCategoryList: FoodServices()),
        child:ExploreMenuPage()));
     }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: onWillPopCall,
    child:Scaffold(
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
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Constants.colors[1],
                        // fontFamily: "Exo-Regular"
                    ),
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(
                    height: screenHeight(context, dividedBy: 20),
                  ),
                  ListView.builder(
                    itemCount: food.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: screenHeight(context,
                                dividedBy: 80),
                          ),
                          Container(
                            width: screenWidth(context, dividedBy: 1),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment:
                                  MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      food[index].name,
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: Constants.colors[1],
                                          // fontFamily: "Exo-Regular"
                                      ),
                                    ),
                                    SizedBox(
                                      height: screenHeight(context,
                                          dividedBy: 80),
                                    ),
                                    Container(
                                      width: screenWidth(context,
                                          dividedBy: 4),
                                      // color:Colors.blue,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (itemCount[index] > 0)
                                                    itemCount[index] =
                                                        itemCount[index] -
                                                            1;
                                                  // itemCount.insert(index, 100);
                                                  // totalAmountCalculate(itemCount, itemPrice);
                                                  print("ItemCountlist");
                                                  print(itemCount);
                                                });
                                                if(itemCount[index] == 0) {
                                                  setState(() {
                                                    food.removeAt(index);
                                                    // itemPrice.removeAt(index);
                                                  });
                                                }
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                size: 17,
                                                color: Colors.black,
                                              )),
                                          Spacer(),
                                          Text(
                                            itemCount[index].toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 17,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                itemCount[index] =
                                                    itemCount[index] + 1;
                                                // itemCount.insert(index, itemCount[index]);
                                                totalAmountCalculate(
                                                    itemCount, itemPrice);
                                                // itemCount.insert(index, 200);
                                                print("ItemCountlist");
                                                print(itemCount);
                                              });
                                            },
                                            child: Icon(
                                              Icons.add,
                                              size: 17,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text(
                                  "C\$" + food[index].price,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Constants.colors[2],
                                      // fontFamily: "Exo-Regular"
                                  )
                                  ,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: screenHeight(context,
                                dividedBy: 40),
                          ),
                          Divider(
                            color: Constants.colors[1].withOpacity(0.4),
                          )
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: screenHeight(context, dividedBy: 20),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Constants.colors[1],
                              // fontFamily: "Exo-Regular"
                          ),
                        ),
                        Text(
                          "C\$ " + cartAmount.toString(),
                          style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Constants.colors[1],
                              // fontFamily: "Exo-Regular"
                          ),
                        ),
                      ]),
                  SizedBox(
                    height: screenHeight(context, dividedBy: 10),
                  ),
                  Text(
                    "Address",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Constants.colors[1],
                        // fontFamily: "Exo-Regular"
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(context, dividedBy: 30),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Change",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Constants.colors[2],
                            // fontFamily: "Exo-Regular"
                        ),
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
    ),);
  }
}

