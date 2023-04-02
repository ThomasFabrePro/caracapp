import 'package:caracapp/database/database.dart';
import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/utils/color_theme.dart';
import 'package:caracapp/utils/data_access_object/character_dao.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatefulWidget {
  Character character;
  CharacterDao characterDao;
  MyAppBar({super.key, required this.character, required this.characterDao});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  double height = 100;
  double width = 100;
  // String characterName = "";
  TextStyle nameStyle = const TextStyle(color: Colors.white, fontSize: 35);
  // Character character = Character(4, "", MyImages().imagePath[image.ninja3]!);
  @override
  void initState() {
    // characterName = widget.character.name;
    // character = widget.character;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // test();
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
          hintText: widget.character.name,
        ),
        onChanged: (value) {
          widget.character.name = value;
          widget.character.setName(value);
          widget.characterDao.updateCharacter(widget.character);
        },
      ),
    );
  }
}
