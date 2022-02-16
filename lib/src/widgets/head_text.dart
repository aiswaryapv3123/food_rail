import 'package:flutter/material.dart';

class HeadText extends StatelessWidget {

  final String title;
  const HeadText({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Text(title,
          style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontFamily: "Exo-Regular",
              fontWeight: FontWeight.w700))
    );
  }
}
