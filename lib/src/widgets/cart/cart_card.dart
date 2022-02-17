import 'package:flutter/material.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';
import 'package:food_rail/src/widgets/cart/count_button.dart';

class CartCard extends StatefulWidget {
  final ValueChanged<int> onCountChanged;
  const CartCard({Key key, this.onCountChanged}) : super(key: key);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                "Butter chicken fronkie",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Constants.colors[1],
                    fontFamily: "Exo-Regular"),
              ),
              SizedBox(
                height: screenHeight(context, dividedBy: 80),
              ),
              CountButton(
                onItemCountChange: (val) {
                  widget.onCountChanged(val);
                  setState(() {
                    itemCount = val;
                  });
                  // print("itemcount" + itemCount.toString());
                  print("value" + val.toString());
                },
              ),
            ],
          ),
          Text(
            "C\$ 10.00",
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Constants.colors[2],
                fontFamily: "Exo-Regular"),
          ),
        ],
      ),
    );
  }
}
