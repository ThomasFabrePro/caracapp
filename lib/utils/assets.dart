import 'package:flutter/material.dart';

class MyImages {
  Map<image, String> imagePath = {
    image.ninja1: "assets/ninja_images/ninja_1.jpg",
    image.ninja2: "assets/ninja_images/ninja_2.png",
    image.ninja3: "assets/ninja_images/ninja_3.png",
    image.ninja4: "assets/ninja_images/ninja_4.png",
    image.ninja5: "assets/ninja_images/ninja_5.jpeg",
    image.ninja6: "assets/ninja_images/ninja_6.jpeg",
  };
}

enum image {
  ninja1,
  ninja2,
  ninja3,
  ninja4,
  ninja5,
  ninja6,
}

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
}
