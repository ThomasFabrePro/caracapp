import 'package:caracapp/main.dart';
import 'package:caracapp/models/character_model.dart';

import 'package:caracapp/widgets/blocs/attribute_bloc.dart';
import 'package:caracapp/widgets/blocs/caracteristics_upgrade_bloc.dart';
import 'package:caracapp/widgets/blocs/elements_bloc.dart';
import 'package:caracapp/widgets/blocs/infos_bloc.dart';
import 'package:caracapp/widgets/blocs/jutsus_bloc.dart';
import 'package:caracapp/widgets/blocs/photo_bloc.dart';
import 'package:caracapp/widgets/blocs/speciality_bloc.dart';
import 'package:flutter/material.dart';

class AddCharacterPage extends StatefulWidget {
  final Character character;
  const AddCharacterPage({super.key, required this.character});

  @override
  State<AddCharacterPage> createState() => _AddCharacterPageState();
}

class _AddCharacterPageState extends State<AddCharacterPage> {
  double textFieldWidthPercent = 0.65;
  bool displayPhotosGrid = false;
  ScrollController scrollController = ScrollController();
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Création de personnage")),
        ),
        body: Container(
          height: height,
          width: width,
          color: const Color.fromARGB(255, 0, 0, 0),
          child: Stack(
            children: [
              Center(
                child: Container(
                  constraints: const BoxConstraints(
                    maxWidth: 1000,
                  ),
                  width: width,
                  height: height,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Image.asset(
                      "assets/front/background2.jpg",
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: <Widget>[
                      InfosBloc(widget.character, textFieldWidthPercent),
                      PhotoBloc(widget.character),
                      const SizedBox(height: 20),
                      Divider(
                          endIndent: width * 0.1,
                          indent: width * 0.1,
                          color: Colors.white,
                          thickness: 2),
                      CaracteristicsUpgradeBloc(
                        character: widget.character,
                      ),
                      const SizedBox(height: 20),
                      Divider(
                          endIndent: width * 0.1,
                          indent: width * 0.1,
                          color: Colors.white,
                          thickness: 2),
                      AttributeBloc(
                          character: widget.character,
                          scrollController: scrollController),
                      const SizedBox(height: 20),
                      Divider(
                          endIndent: width * 0.1,
                          indent: width * 0.1,
                          color: Colors.white,
                          thickness: 2),
                      SpecialityBloc(character: widget.character),
                      const SizedBox(height: 20),
                      Divider(
                          endIndent: width * 0.1,
                          indent: width * 0.1,
                          color: Colors.white,
                          thickness: 2),
                      ElementBloc(character: widget.character),
                      const SizedBox(height: 20),
                      Divider(
                          endIndent: width * 0.1,
                          indent: width * 0.1,
                          color: Colors.white,
                          thickness: 2),
                      JutsuBloc(character: widget.character),
                      const SizedBox(height: 20),
                      ValidateButton(
                        character: widget.character,
                      ),
                      const SizedBox(height: 50),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ValidateButton extends StatefulWidget {
  final Character character;
  const ValidateButton({
    super.key,
    required this.character,
  });

  @override
  State<ValidateButton> createState() => _ValidateButtonState();
}

class _ValidateButtonState extends State<ValidateButton> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.5,
      height: height * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ElevatedButton(
          onPressed: () async {
            Character character = widget.character;
            character
              ..chakraMax = character.chakraMax + character.chakraBuffer
              ..chakra = character.chakraMax
              ..hpMax = character.hpMax + character.hpBuffer
              ..hp = character.hpMax
              ..dodge = character.dodge + character.dodgeBuffer
              ..constitution =
                  character.constitution + character.constitutionBuffer
              ..genjutsu = character.genjutsu + character.genjutsuBuffer
              ..ninjutsu = character.ninjutsu + character.ninjutsuBuffer
              ..taijutsu = character.taijutsu + character.taijutsuBuffer
              ..luck = character.luck + character.luckBuffer
              ..perception = character.perception + character.perceptionBuffer
              ..throwing = character.throwing + character.throwingBuffer
              ..hpBuffer = 0
              ..dodgeBuffer = 0
              ..constitutionBuffer = 0
              ..genjutsuBuffer = 0
              ..ninjutsuBuffer = 0
              ..taijutsuBuffer = 0
              ..luckBuffer = 0
              ..perceptionBuffer = 0
              ..throwingBuffer = 0
              ..chakraBuffer = 0
              ..pointsLeftToSpend = 0
              ..logs = "";
            await character.update();
            runApp(MyApp(
              character: character,
              addCharacter: false,
            ));
          },
          child: const Center(
            child: Text(
              'TERMINER',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
