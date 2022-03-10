import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_rail/src/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerTabView extends StatefulWidget {
  const ShimmerTabView({
    Key key,
  }) : super(key: key);

  @override
  _ShimmerTabViewState createState() => _ShimmerTabViewState();
}

class _ShimmerTabViewState extends State<ShimmerTabView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1),
      height: screenHeight(context, dividedBy: 30),
      color: Colors.white,
      child: Center(
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(
                  right: screenWidth(context, dividedBy: 30),
                  top: screenHeight(context, dividedBy: 60)),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.white,
                child: Container(
                  width: screenWidth(context, dividedBy: 3),
                  height: screenHeight(context, dividedBy: 30),
                  decoration: BoxDecoration(
                      color:Colors.pink,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(4),
                      topLeft: Radius.circular(4)
                    )
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
