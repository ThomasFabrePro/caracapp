import 'package:flutter/material.dart';

class MyDecoration {
  static BoxShadow boxShadow = BoxShadow(
    color: const Color.fromARGB(110, 0, 0, 0).withOpacity(0.5),
    spreadRadius: 4,
    blurRadius: 7,
    offset: const Offset(3, 3), // changes position of shadow
  );
  static BoxShadow textFieldBoxShadow = BoxShadow(
    color: const Color.fromARGB(110, 0, 0, 0).withOpacity(0.5),
    spreadRadius: 1.0,
    blurRadius: 3,
    offset: const Offset(3, 3), // changes position of shadow
  );
  static Color green = Colors.green;
  static const Color bloodColor = Color.fromARGB(250, 107, 0, 0);
  static const TextStyle dataStyle = TextStyle(
    fontSize: 18,
  );
  static const TextStyle titleStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
}
