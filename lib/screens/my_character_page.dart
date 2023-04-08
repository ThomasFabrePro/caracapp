import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/data_access_object/character_dao.dart';
import 'package:caracapp/widgets/lowerWidgets/app_bar.dart';
import 'package:caracapp/widgets/character_picture.dart';
import 'package:flutter/material.dart';

class MyCharacterPage extends StatefulWidget {
  Character character;
  CharacterDao characterDao;
  MyCharacterPage(
      {super.key,
      required this.title,
      required this.character,
      required this.characterDao});

  final String title;

  @override
  State<MyCharacterPage> createState() => _MyCharacterPageState();
}

class _MyCharacterPageState extends State<MyCharacterPage> {
  String title = "";
  // TextEditingController textController = TextEditingController();
  @override
  void initState() {
    title = widget.title;
    // textController.text = "coucou";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            MyAppBar(
                character: widget.character, characterDao: widget.characterDao),
            CharacterPicture(
                character: widget.character, characterDao: widget.characterDao),
          ],
        ),
      ),
    );
  }
}
