import 'package:flutter/material.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

class ExploreMenu extends StatefulWidget {
  const ExploreMenu({Key key}) : super(key: key);

  @override
  _ExploreMenuState createState() => _ExploreMenuState();
}

class _ExploreMenuState extends State<ExploreMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // TextButton(
          //   style: ButtonStyle(
          //     shape: MaterialStateProperty.all<PolygonBorder>(
          //         PolygonBorder(sides: 8, side: BorderSide())
          //     ),
          //     backgroundColor: Colors.red
          //   ),
          //   onPressed: () { },
          //   child: Text('8'),
          // ),
          Center(
            child: SizedBox(
              width: screenWidth(context, dividedBy: 6),
              height: screenWidth(context, dividedBy: 6),
              child: ClipPolygon(
                sides: 10,
                borderRadius:4.0, // Defaults to 0.0 degrees
                rotate: 90.0, // Defaults to 0.0 degrees
                // boxShadows: [
                //   PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                //   PolygonBoxShadow(color: Colors.grey, elevation: 5.0)
                // ],
                child: Container(
                  color: Constants.colors[3],
                  child: Center(
                    child: Text("%",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontFamily: "Exo-Regular",
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: screenWidth(context, dividedBy: 1.3),
            child: Row(
              children: [
                Text("Beverages",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: "Exo-Regular",
                        fontWeight: FontWeight.w600)),
                Spacer(),
                Text("Daily Special's Food Menu",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: "Exo-Regular",
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
