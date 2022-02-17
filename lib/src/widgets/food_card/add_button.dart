import 'package:flutter/material.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';

class AddButton extends StatefulWidget {
  final Function onPressed;
  final String label;
  const AddButton({Key key, this.onPressed, this.label}) : super(key: key);

  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(context, dividedBy: 40),
            vertical: screenHeight(context, dividedBy: 200)),
        decoration: BoxDecoration(
            color: Constants.colors[3], borderRadius: BorderRadius.circular(5)),
        child: Text(widget.label,
            style: TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontFamily: "Exo-Regular",
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
