import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';

class CustomTabView extends StatefulWidget {
  const CustomTabView({Key key, this.title, this.onTap}) : super(key: key);
  final List<String> title;
  final Function onTap;

  @override
  _CustomTabViewState createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1),
      height: screenHeight(context, dividedBy: 12),
      color: Colors.white,
      padding: EdgeInsets.only(left: screenWidth(context, dividedBy: 40)),
      child: ListView.builder(
        itemCount: widget.title.length,
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
                  selectedIndex = index;
                  print("Index " + index.toString());
                });
                widget.onTap();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: index == selectedIndex
                          ? Constants.colors[2]
                          : Colors.transparent,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Text(
                  widget.title[index],
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: index == selectedIndex
                          ? Constants.colors[2]
                          : Colors.grey,
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
