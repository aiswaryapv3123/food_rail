import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_rail/src/api/services.dart';
import 'package:food_rail/src/bloc/home_bloc.dart';
import 'package:food_rail/src/screens/home_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: BlocProvider(
          create: (context) => HomeBloc(foodHomeRepo: FoodServices()),
          child: HomePage()),
    );
  }
}
