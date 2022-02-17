import 'package:flutter/material.dart';
import 'package:food_rail/src/utils/constants.dart';
import 'package:food_rail/src/utils/utils.dart';

class CountButton extends StatefulWidget {
  const CountButton({Key key, this.onItemCountChange})
      : super(key: key);
  final ValueChanged<int> onItemCountChange;

  @override
  _CountButtonState createState() => _CountButtonState();
}

class _CountButtonState extends State<CountButton> {
  int itemCount = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, dividedBy:4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
              onTap: () {
                setState(() {
                  if (itemCount > 0) itemCount--;
                });
                widget.onItemCountChange(itemCount);
              },
              child: Icon(
                Icons.remove,
                size:17,
                color: Colors.black,
              )),
          Spacer(),
          Text(
            itemCount.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17,
              color: Colors.black,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  itemCount++;
                },
              );
              widget.onItemCountChange(itemCount);
            },
            child: Icon(
              Icons.add,
              size:17,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
