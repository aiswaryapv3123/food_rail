import 'package:flutter/material.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';

class CartButton extends StatefulWidget {
  final Function onPressed;
  final String label;
  const CartButton({Key key, this.onPressed, this.label}) : super(key: key);

  @override
  _CartButtonState createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: screenWidth(context, dividedBy: 1.1),
        height: screenHeight(context, dividedBy: 15),
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context, dividedBy: 40),
            vertical: screenHeight(context, dividedBy: 200)),
        decoration: BoxDecoration(
            color: Constants.colors[2], borderRadius: BorderRadius.circular(4)),
        child: Center(
          child: Text(
            widget.label,
            style: TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontFamily: "Exo-Regular",
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
