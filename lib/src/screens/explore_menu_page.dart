import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_rail/src/api/services.dart';
import 'package:food_rail/src/bloc/category_list_bloc.dart';
import 'package:food_rail/src/bloc/events.dart';
import 'package:food_rail/src/bloc/home_bloc.dart';
import 'package:food_rail/src/bloc/products_bloc.dart';
import 'package:food_rail/src/bloc/states.dart';
import 'package:food_rail/src/models/get_products.dart';
import 'package:food_rail/src/models/request_products.dart';
import 'package:food_rail/src/screens/bottom_navigation_bar.dart';
import 'package:food_rail/src/screens/cart_page.dart';
import 'package:food_rail/src/screens/home_page.dart';
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
  List<Product> cartFoodList = [];
  var productsList;
  int productId;
  GetProducts data;
  bool loadProducts = true;
  // List<Product> products;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
    // get();
    setState(() {
      cartFoodList =[];
    });
    productsRequest(productId: "105");
    // requestProducts(productId: "105");
  }

  _loadData() async {
    context.bloc<CategoryListBloc>().add(FoodEvents.fetchCategoryList);
  }

  Future<GetProducts> productsRequest({String productId}) async {
    String apiUrl = "http://fda.intertoons.com/api/V1/products";
    final headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer akhil@intertoons.com",
      // encoding: encoding
    };
    // {
    //   HttpHeaders.authorizationHeader: 'Bearer akhil@intertoons.com',
    // };
    final Map<String, dynamic> body = {
      "currentpage": 1,
      "pagesize": 100,
      "sortorder": {"field": "menu_name", "direction": "desc"},
      "searchstring": "",
      "filter": {"category": productId}
    };
    var jsonBody = json.encode(body);
    Response response =
        await http.post(apiUrl, body: jsonBody, headers: headers);
    var jsonResponse = jsonDecode(response.body);
    print("Response body data productRequest");
    print(jsonResponse);

    final Map parsed = json.decode(response.body);
    final products = GetProducts.fromJson(parsed);
    print("Prducts Name list");
    for (int i = 0; i < products.data.products.length; i++) {
      print(products.data.products[i].name);
    }
    print("Prducts list");
    setState(() {
      data = products;
      loadProducts = false;
    print(data);
    });
  }

  Future<bool> onWillPopCall (){
    push(context, BlocProvider(
        create: (context) => HomeBloc(foodHomeRepo: FoodServices()),
        child: HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
        onWillPop: onWillPopCall,
        child:Scaffold(
            bottomNavigationBar: BottomBar(
              index: 1,
            ),
            appBar: AppBar(
              toolbarHeight: screenHeight(context, dividedBy: 6),
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
                    screenHeight(context, dividedBy: 12)),
                child: BlocBuilder<CategoryListBloc, FoodStates>(
                  builder: (BuildContext context, FoodStates state) {
                    if (state is CategoryErrorState) {
                      final error = state.error;
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height * 0.8,
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
                            print("Val Id " + val.toString());
                            productsRequest(productId: val);
                            // setState(() {
                            //   productId = val;
                            // });
                            print("Selected Id " + productId.toString());
                          });
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
                    child: loadProducts == true
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Center(
                              child: SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor:
                                      AlwaysStoppedAnimation(Constants.colors[1]),
                                ),
                              ),
                            ),
                          )
                        : data.data.products.isEmpty
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.8,
                                child: Center(
                                  child: Text(
                                    "No Products Available",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Constants.colors[1],
                                        fontFamily: "Exo-Regular"),
                                  ),
                                ),
                              )
                            : Column(
                              children: [
                                ListView.separated(
                                    itemCount: data.data.products.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (ctx, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            productsRequest();
                                          },
                                          child: MenuCard(
                                            products: data.data.products[index],
                                            onAddItem: () {
                                              setState(() {
                                                cartList.add(index);
                                                print(cartList);
                                                cartFoodList
                                                    .add(data.data.products[index]);
                                                print(cartFoodList);
                                                print("Cart Length " +
                                                    cartFoodList.length.toString());
                                              });
                                            },
                                          ));
                                    },
                                    separatorBuilder: (ctx, index) {
                                      return Divider(
                                        color: Constants.colors[1],
                                      );
                                    },
                                  ),
                                cartFoodList.length <= 0
                                    ? Container() : SizedBox(
                                  height: screenHeight(context, dividedBy: 10),
                                ),
                              ],
                            ),
                  ),
                ),
                cartFoodList.length <= 0
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
                                  push(
                                      context,
                                      CartPage(
                                        products: cartFoodList,
                                      ));
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

        ));
  }
}
