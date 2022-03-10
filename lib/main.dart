import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_rail/src/app.dart';
// import 'package:food_rail/src/widgets/cart/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark
  ));
  runApp(MyApp(
    // model: CartModel(),
  ));
}

// class MyApp extends StatelessWidget{
//
//   final CartModel model;
//
//   const MyApp({Key key, @required this.model}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return ScopedModel<CartModel>(
//       model: model,
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Food App',
//         home: HomePage(),
//         // routes: {'/cart': (context) => CartPage()},
//       ),
//     );
//   }
// }