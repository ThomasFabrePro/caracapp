import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/widgets/lowerWidgets/my_text_field.dart';
import 'package:flutter/material.dart';

class InfosBloc extends StatefulWidget {
  final Character character;
  final double textFieldWidthPercent;
  const InfosBloc(this.character, this.textFieldWidthPercent, {super.key});

  @override
  State<InfosBloc> createState() => _InfosBlocState();
}

class _InfosBlocState extends State<InfosBloc> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 1000,
        ),
        child: Column(
          children: [
            MyTextField(
              title: "Nom :",
              hint: widget.character.name,
              onChanged: (value) async {
                if (value != "" && mounted) {
                  await widget.character.setName(value);
                  setState(() {});
                }
              },
              textFieldWidthPercent: widget.textFieldWidthPercent,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              title: "Sexe :",
              hint: widget.character.sexe,
              onChanged: (value) async {
                if (value != "" && mounted) {
                  await widget.character.setSexe(value);
                  setState(() {});
                }
              },
              textFieldWidthPercent: widget.textFieldWidthPercent,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              title: "Age :",
              hint: "${widget.character.age}",
              onChanged: (value) async {
                if (value != "" && mounted) {
                  await widget.character.setAge(int.parse(value));
                  setState(() {});
                }
              },
              textFieldWidthPercent: widget.textFieldWidthPercent,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              title: "Origine :",
              hint: widget.character.origin,
              onChanged: (value) async {
                if (value != "" && mounted) {
                  await widget.character.setOrigin(value);
                  setState(() {});
                }
              },
              textFieldWidthPercent: widget.textFieldWidthPercent,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
