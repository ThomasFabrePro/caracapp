import 'package:flutter/material.dart';

class CharacterPicture extends StatelessWidget {
  const CharacterPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.2,
      width: width,
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: GestureDetector(
            child: Image.asset("assets/ninja_images/ninja_1.jpg"),
          )),
    );
  }
}
