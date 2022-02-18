import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_rail/src/bloc/category_list_bloc.dart';
import 'package:food_rail/src/bloc/events.dart';
import 'package:food_rail/src/bloc/products_bloc.dart';
import 'package:food_rail/src/bloc/states.dart';
import 'package:food_rail/src/models/get_products.dart';
import 'package:food_rail/src/models/request_products.dart';
import 'package:food_rail/src/screens/bottom_navigation_bar.dart';
import 'package:food_rail/src/screens/cart_page.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';
import 'package:food_rail/src/widgets/explore_menu/custom_tab_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_rail/src/widgets/explore_menu/menu_cards.dart';
import 'package:food_rail/src/widgets/explore_menu/shimmer_tab_view.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ExploreMenuPage extends StatefulWidget {
  const ExploreMenuPage({Key key}) : super(key: key);

  @override
  _ExploreMenuPageState createState() => _ExploreMenuPageState();
}

class _ExploreMenuPageState extends State<ExploreMenuPage> {
  List<String> categories = [];
  List<String> categoryId = [];
  List<int> cartList = [];
  GetProducts products;
  int productId;
  GetProducts data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
    // requestProducts(productId: "105");
  }

  _loadData() async {
    context.bloc<CategoryListBloc>().add(FoodEvents.fetchCategoryList);
  }


  productsRequest({String productId}) async {
    final uri = Uri.parse('http://fda.intertoons.com/api/V1/products');
    final headers = {
      HttpHeaders.authorizationHeader: 'Bearer akhil@intertoons.com',
    };
    Map<String, dynamic> body = {
      "currentpage": 1,
      "pagesize": 100,
      "sortorder": {
        "field": "menu_name",
        "direction": "desc"
      },
      "searchstring": "",
      "filter": {
        "category": "103"
      }
    };
    var jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');

    Response response = await post(
      uri,
      headers: headers,
      body: json.encode(body),
      encoding: encoding,
    );
    if (response.statusCode == 201 || response.statusCode == 200) {
      // products = jsonDecode(response.body);
      data = jsonDecode(response.body);
      print("Products");
      print(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create Request');
    }
    // int statusCode = response.statusCode;
    // String responseBody = response.body;
    // print("Response Body");
    // print(response.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        index: 1,
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Container(),
        actions: [
          Container(
            width: screenWidth(context, dividedBy: 1),
            padding: EdgeInsets.symmetric(
                vertical: screenHeight(context, dividedBy: 40),
                horizontal: screenWidth(context, dividedBy: 30)),
            child: Text(
              "Explore menu",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Constants.colors[0],
                  fontFamily: "Exo-Regular"),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(screenWidth(context, dividedBy: 1),
              screenHeight(context, dividedBy: 10)),
          child: BlocBuilder<CategoryListBloc, FoodStates>(
            builder: (BuildContext context, FoodStates state) {
              if (state is CategoryErrorState) {
                final error = state.error;
                return Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.8,
                  child: Center(
                    child: Text(
                      error.message,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Constants.colors[1],
                          fontFamily: "Exo-Regular"),
                    ),
                  ),
                );
              }
              if (state is CategoryLoadedState) {
                // for (int i = 0;
                //     i < state.getCategoryListData.data.length;
                //     i++) {
                //   categories.add(state.getCategoryListData.data[i].catName);
                //   categoryId
                //       .add(state.getCategoryListData.data[i].catId.toString());
                // }
                return CustomTabView(
                    data: state.getCategoryListData.data,
                    onTap: (val) {
                      productsRequest(productId: val.toString());
                      setState(() {
                        productId = val;
                      });
                      print("Selected Id " + productId.toString());
                    }
                );
              }
              return ShimmerTabView();
            },
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context, dividedBy: 90),
                  vertical: screenHeight(context, dividedBy: 100)),
              child: ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    child: MenuCard(
                      onAddItem: () {
                        setState(() {
                          cartList.add(index);
                          print(cartList);
                          print("Cart Length " + cartList.length.toString());
                        });
                      },
                    ),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return Divider(
                    color: Constants.colors[1],
                  );
                },
              ),
            ),
          ),
          cartList.length <= 0
              ? Container()
              : Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth(context, dividedBy: 1),
              height: screenHeight(context, dividedBy: 12),
              padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(context, dividedBy: 50)),
              color: Colors.black,
              child: Row(
                children: [
                  Text(
                    cartList.length.toString() + " Item (s) in cart",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Constants.colors[0],
                        fontFamily: "Exo-Regular"),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      push(context, CartPage());
                    },
                    child: Text(
                      "View Cart",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Constants.colors[0],
                          fontFamily: "Exo-Regular"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}