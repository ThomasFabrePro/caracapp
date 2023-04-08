import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/utils/color_theme.dart';
import 'package:caracapp/utils/data_access_object/character_dao.dart';
import 'package:caracapp/widgets/caracteristics_upgrade_bloc.dart';
import 'package:caracapp/widgets/character_picture.dart';
import 'package:caracapp/widgets/lowerWidgets/my_text_field.dart';
import 'package:flutter/material.dart';

class AddCharacterPage extends StatefulWidget {
  final Character character;
  final CharacterDao characterDao;
  const AddCharacterPage(
      {super.key, required this.characterDao, required this.character});

  @override
  State<AddCharacterPage> createState() => _AddCharacterPageState();
}

class _AddCharacterPageState extends State<AddCharacterPage> {
  double textFieldWidthPercent = 0.65;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Création de personnage")),
        ),
        body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 73, 223, 78),
                Color.fromARGB(255, 33, 243, 191),
              ],
            ),
          ),
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    MyTextField(
                      title: "Nom :",
                      hint: "${widget.character.name}",
                      onChanged: (value) async {
                        if (value != "" && mounted) {
                          setState(() async {
                            await widget.character.setName(value);
                          });
                        }
                      },
                      textFieldWidthPercent: textFieldWidthPercent,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                      title: "Sexe :",
                      hint: "${widget.character.sexe}",
                      onChanged: (value) {
                        if (value != "" && mounted) {
                          setState(() async {
                            await widget.character.setSexe(value);
                          });
                        }
                      },
                      textFieldWidthPercent: textFieldWidthPercent,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                      title: "Age :",
                      hint: "${widget.character.age}",
                      onChanged: (value) {
                        if (value != "" && mounted) {
                          setState(() async {
                            await widget.character.setAge(value);
                          });
                        }
                      },
                      textFieldWidthPercent: textFieldWidthPercent,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyTextField(
                      title: "Origine :",
                      hint: "${widget.character.origin}",
                      onChanged: (value) {
                        if (value != "" && mounted) {
                          setState(() async {
                            await widget.character.setOrigin(value);
                          });
                        }
                      },
                      textFieldWidthPercent: textFieldWidthPercent,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CharacterPicture(
                      character: widget.character,
                      characterDao: widget.characterDao)),
              const SizedBox(
                height: 30,
              ),
              const Text("Caractéristiques",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 16.0, left: 16.0, right: 16.0),
                child: CaracteristicsUpgradeBloc(character: widget.character),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
