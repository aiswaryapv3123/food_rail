import 'package:flutter/material.dart';

double height(context, {double height}) {
  return MediaQuery.of(context).size.height / height;
}

double width(context, {double width}) {
  return MediaQuery.of(context).size.width / width;
}
