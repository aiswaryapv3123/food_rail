import 'package:flutter/material.dart';
import 'package:food_rail/src/bloc/category_list_bloc.dart';
import 'package:food_rail/src/bloc/events.dart';
import 'package:food_rail/src/bloc/states.dart';
import 'package:food_rail/src/screens/bottom_navigation_bar.dart';
import 'package:food_rail/src/screens/cart_page.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';
import 'package:food_rail/src/widgets/explore_menu/custom_tab_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_rail/src/widgets/explore_menu/menu_cards.dart';
import 'package:food_rail/src/widgets/explore_menu/shimmer_tab_view.dart';

class ExploreMenuPage extends StatefulWidget {
  const ExploreMenuPage({Key key}) : super(key: key);

  @override
  _ExploreMenuPageState createState() => _ExploreMenuPageState();
}

class _ExploreMenuPageState extends State<ExploreMenuPage> {
  List<String> categories = [];
  List<int> cartList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  _loadData() async {
    context.bloc<CategoryListBloc>().add(FoodEvents.fetchCategoryList);
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
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(screenWidth(context, dividedBy: 1),
              screenHeight(context, dividedBy: 10)),
          child: BlocBuilder<CategoryListBloc, FoodStates>(
            builder: (BuildContext context, FoodStates state) {
              if (state is CategoryErrorState) {
                final error = state.error;
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.8,
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
                for (int i = 0; i < 10; i++) {
                  categories.add(state.getCategoryListData.data[i].catName);
                }
                return CustomTabView(
                  title: categories,
                  onTap: () {
                    // for (int i = 0; i < categories.length; i++) {
                    //   setState(() {
                    //     categoryId = i;
                    //     print(
                    //       " Category id and type" +
                    //           i.toString() +
                    //           categories[i],
                    //     );
                    //   });
                    // }
                  },
                );
              }
              return ShimmerTabView();
              //   Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height * 0.8,
              //   child: Center(
              //     child: SizedBox(
              //       width: 18,
              //       height: 18,
              //       child: CircularProgressIndicator(
              //         strokeWidth: 2,
              //         valueColor: AlwaysStoppedAnimation<Color>(
              //           Constants.colors[1],
              //         ),
              //       ),
              //     ),
              //   ),
              // );
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
          categories.length == 0
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
                          cartList.length.toString()+" Item (s) in cart",
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
