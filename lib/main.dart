import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_rail/src/app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark
  ));
  runApp(MyApp());
}
