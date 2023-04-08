import 'dart:math';

import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/utils/data_access_object/character_dao.dart';
import 'package:caracapp/widgets/lowerWidgets/my_text_field.dart';
import 'package:flutter/material.dart';

class CharacterPicture extends StatefulWidget {
  final Character character;
  final CharacterDao characterDao;

  const CharacterPicture({
    super.key,
    required this.character,
    required this.characterDao,
  });

  @override
  State<CharacterPicture> createState() => _CharacterPictureState();
}

class _CharacterPictureState extends State<CharacterPicture> {
  double textFieldWidthPercent = 0.42;
  double titleFieldWidthPercent = 0.21;
  TextStyle dataStyle = TextStyle(
    fontSize: 18,
  );
  TextStyle titleStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.2,
      width: width,
      child: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
          child: Row(
            children: [
              SizedBox(
                width: width * 0.30,
                child: GestureDetector(
                  onTap: (() async {
                    setState(() {
                      String newPicture = "";
                      int rand = Random().nextInt(2);
                      switch (rand) {
                        case 0:
                          newPicture = MyImages().imagePath[image.ninja4]!;
                          break;
                        case 1:
                          newPicture = MyImages().imagePath[image.ninja5]!;
                          break;
                      }
                      widget.character.setPicture(newPicture);
                      widget.characterDao.updateCharacter(widget.character);
                    });
                  }),
                  child: Image.asset(widget.character.picture),
                ),
              ),
              SizedBox(width: width * 0.03),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyTextField(
                      title: "Sexe :",
                      hint: widget.character.name,
                      onChanged: (value) {
                        setState(() {
                          // widget.character.setSexe(value);
                        });
                      },
                    ),
                    MyTextField(
                      title: "Age :",
                      hint: "Age",
                      onChanged: () {},
                    ),
                    MyTextField(
                      title: "Origine :",
                      hint: "Origine",
                      onChanged: () {},
                    ),
                  ])
            ],
          )),
    );
  }
}
