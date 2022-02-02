import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle get titleStyle {
  return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: Colors.black,
      shadows: [
        BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(-5, 5),
            spreadRadius: 0)
      ]);
}

List<BoxShadow> get shadows {
  return [
    BoxShadow(
        blurRadius: 5,
        color: Colors.black.withOpacity(0.5),
        offset: const Offset(-5, 7),
        spreadRadius: 0)
  ];
}

List<BoxShadow> get boxShadows {
  return [
    BoxShadow(
        blurRadius: 20,
        color: Colors.greenAccent.withOpacity(0.9),
        offset: const Offset(0, -10),
        spreadRadius: 3)
  ];
}
