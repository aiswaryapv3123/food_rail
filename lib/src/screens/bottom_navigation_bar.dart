import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_rail/src/api/services.dart';
import 'package:food_rail/src/bloc/category_list_bloc.dart';
import 'package:food_rail/src/bloc/home_bloc.dart';
import 'package:food_rail/src/screens/explore_menu_page.dart';
import 'package:food_rail/src/screens/home_page.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';

class Account extends StatelessWidget {
  const Account({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(
          index: 3,
        ),
        body: Center(child: Text("Account")));
  }
}

class Search extends StatelessWidget {
  const Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomBar(
          index: 2,
        ),
        body: Center(child: Text("Search")));
  }
}

class BottomBar extends StatefulWidget {
  final int index;
  BottomBar({this.index});
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex;
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      currentIndex = widget.index;
    });
    super.initState();
  }

  final _pageOptions = [
    BlocProvider(
        create: (context) => HomeBloc(foodHomeRepo: FoodServices()),
        child: HomePage()),
  BlocProvider(
  create: (context) => CategoryListBloc(foodCategoryList: FoodServices()),
  child:ExploreMenuPage()),
    Search(),
    Account()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
            width: screenWidth(context, dividedBy: 1),
            height: screenHeight(context, dividedBy: 12),
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                        push(context, _pageOptions[0]);
                        print("Index" + currentIndex.toString());
                      });
                    },
                    child: Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: currentIndex == 0
                              ? Constants.colors[2]
                              : Colors.grey,
                          fontFamily: "Exo-Regular"),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                        push(context, _pageOptions[1]);
                        print("Index" + currentIndex.toString());
                      });
                    },
                    child: Text(
                      "Menu",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: currentIndex == 1
                              ? Constants.colors[2]
                              : Colors.grey,
                          fontFamily: "Exo-Regular"),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        print("Index" + currentIndex.toString());
                        currentIndex = 2;
                        push(context, _pageOptions[2]);
                      });
                    },
                    child: Text(
                      "Search",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: currentIndex == 2
                              ? Constants.colors[2]
                              : Colors.grey,
                          fontFamily: "Exo-Regular"),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                        push(context, _pageOptions[3]);
                        print("Index" + currentIndex.toString());
                      });
                    },
                    child: Text(
                      "Account",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: currentIndex == 3
                              ? Constants.colors[2]
                              : Colors.grey,
                          fontFamily: "Exo-Regular"),
                    ),
                  ),
                  Spacer(),
                ]))
        // BottomNavigationBar(
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.business),
        //       label: 'Business',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.school),
        //       label: 'School',
        //     ),
        //   ],
        //   currentIndex: _selectedIndex,
        //   selectedItemColor: Colors.amber[800],
        //   onTap: _onItemTapped,
        // ),
        ;
  }
}
