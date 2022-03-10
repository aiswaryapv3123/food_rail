import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_rail/src/models/get_category_list_data.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';

class CustomTabView extends StatefulWidget {
  const CustomTabView({Key key, this.data,
    this.onTap
  }) : super(key: key);
  final List<Datum> data;
  final ValueChanged<String> onTap;

  @override
  _CustomTabViewState createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  String selectedIndex = "105";
  int tabIndex = 0;
  String productId = "105";
  List<String> categories = [];
  @override
  void initState() {
    // TODO: implement initState
    for (int i = 0; i < widget.data.length; i++) {
      categories.add(widget.data[i].catName);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1),
      height: screenHeight(context, dividedBy: 12),
      color: Colors.white,
      padding: EdgeInsets.only(left: screenWidth(context, dividedBy: 40)),
      child: ListView.builder(
        itemCount: categories.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(
                right: screenWidth(context, dividedBy: 30),
                top: screenHeight(context, dividedBy: 60)),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  tabIndex = index;
                  selectedIndex = widget.data[index].catId.toString();
                  print("Index " + index.toString());
                  print("Selected category Id " + widget.data[index].catId.toString());
                });
                widget.onTap(selectedIndex);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: index == tabIndex
                          ? Constants.colors[2]
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Text(
                  categories[index],
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color:
                          index == tabIndex ? Constants.colors[2] : Colors.grey,
                      fontFamily: "Exo-Regular"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
