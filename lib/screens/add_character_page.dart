import 'package:caracapp/utils/color_theme.dart';
import 'package:caracapp/utils/data_access_object/character_dao.dart';
import 'package:caracapp/widgets/caracteristics_upgrade.dart';
import 'package:caracapp/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class AddCharacterPage extends StatefulWidget {
  final CharacterDao characterDao;
  const AddCharacterPage({super.key, required this.characterDao});

  @override
  State<AddCharacterPage> createState() => _AddCharacterPageState();
}

class _AddCharacterPageState extends State<AddCharacterPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text("Création de personnage"))),
        body: Container(
          height: height,
          width: width,
          color: const Color.fromARGB(85, 11, 132, 43),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                MyTextField(
                  title: "Nom :",
                  hint: "",
                  onChanged: () {},
                  textFieldWidthPercent: 0.65,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  title: "Sexe :",
                  hint: "",
                  onChanged: () {},
                  textFieldWidthPercent: 0.65,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  title: "Age :",
                  hint: "",
                  onChanged: () {},
                  textFieldWidthPercent: 0.65,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  title: "Origine :",
                  hint: "",
                  onChanged: () {},
                  textFieldWidthPercent: 0.65,
                ),
                const SizedBox(
                  height: 10,
                ),
                CaracteristicsUpgrade(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
