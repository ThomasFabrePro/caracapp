import 'package:caracapp/utils/color_theme.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatefulWidget {
  MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  double height = 100;
  double width = 100;
  String characterName = "CoucouCoucouCoucouCoucouCoucouCoucou";
  TextStyle nameStyle = const TextStyle(color: Colors.white, fontSize: 35);
  // FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height * 0.08;
    width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      color: MyColorTheme.colorCustom,
      child: TextField(
        style: nameStyle,
        scrollPadding: EdgeInsets.zero,
        // readOnly: true,
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintStyle: nameStyle,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent)),
          hintText: 'Character',
        ),
        onChanged: (value) {},
      ),
    );
  }
}
