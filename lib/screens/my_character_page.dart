import 'package:caracapp/main.dart';
import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/screens/my_character_page.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/utils/color_theme.dart';
import 'package:caracapp/utils/data_access_object/character_dao.dart';
import 'package:caracapp/widgets/blocs/attribute_bloc.dart';
import 'package:caracapp/widgets/blocs/caracteristics_bloc.dart';
import 'package:caracapp/widgets/blocs/caracteristics_upgrade_bloc.dart';
import 'package:caracapp/widgets/blocs/elements_bloc.dart';
import 'package:caracapp/widgets/blocs/infos_bloc.dart';
import 'package:caracapp/widgets/blocs/inventory_bloc.dart';
import 'package:caracapp/widgets/blocs/jutsus_bloc.dart';
import 'package:caracapp/widgets/blocs/photo_bloc.dart';
import 'package:caracapp/widgets/blocs/speciality_bloc.dart';
import 'package:caracapp/widgets/lowerWidgets/my_text_field.dart';
import 'package:flutter/material.dart';

class MyCharacterPage extends StatefulWidget {
  final Character character;
  const MyCharacterPage({super.key, required this.character});

  @override
  State<MyCharacterPage> createState() => _MyCharacterPageState();
}

class _MyCharacterPageState extends State<MyCharacterPage> {
  double textFieldWidthPercent = 0.65;
  @override
  void dispose() {
    super.dispose();
    print("TEST disposed");
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColorTheme.colorCustom,
          title: FittedBox(
              child: Text(
                  "${widget.character.name} de ${widget.character.origin}")),
          leading: GestureDetector(
            onTap: () {
              // Navigator.pop(context); //TODO decommenter
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
              child: Image.asset(
                "assets/front/star.jpg",
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Container(
          height: height,
          width: width,
          color: Color.fromARGB(255, 0, 0, 0),
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
                    fit: BoxFit.fitWidth,
                    child: Image.asset(
                      "assets/front/background2.jpg",
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  // TODO ADD FOCUS NODES
                  InfosBloc(widget.character, textFieldWidthPercent),

                  PhotoBloc(widget.character),
                  const SizedBox(height: 20),
                  Divider(
                      endIndent: width * 0.1,
                      indent: width * 0.1,
                      color: Colors.white,
                      thickness: 2),

                  CaracteristicsBloc(
                    character: widget.character,
                    isEditable: false,
                  ),
                  const SizedBox(height: 20),
                  Divider(
                      endIndent: width * 0.1,
                      indent: width * 0.1,
                      color: Colors.white,
                      thickness: 2),

                  // Divider(
                  //     endIndent: width * 0.1,
                  //     indent: width * 0.1,
                  //     color: Colors.white,
                  //     thickness: 2),

                  // SpecialityBloc(character: widget.character),
                  // const SizedBox(height: 20),
                  // Divider(
                  //     endIndent: width * 0.1,
                  //     indent: width * 0.1,
                  //     color: Colors.white,
                  //     thickness: 2),

                  JutsuBloc(
                      character: widget.character,
                      hideUnavailableJutsus: true,
                      updateBlocOntimer: false),
                  const SizedBox(height: 20),

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
          onPressed: () {
            runApp(MyApp(
              character: widget.character,
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

// Row(
//                                 children: [
//                                   Container(
//                                     width: width * 0.4,
//                                     height: width * 0.4,
//                                     constraints: BoxConstraints(
//                                         maxHeight: 300, maxWidth: 300),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: Colors.white,
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(3.0),
//                                       child: ClipRRect(
//                                         borderRadius: BorderRadius.circular(10),
//                                         child: Image.asset(
//                                             widget.character.picture),
//                                       ),
//                                     ),
//                                   ),
//                                   // Column(
//                                   //   children: [
//                                   //     Text(
//                                   //       "${character.sexe} - ${character.age} ans ",
//                                   //       style: TextStyle(
//                                   //           color: Colors.white,
//                                   //           fontSize: 20,
//                                   //           fontWeight: FontWeight.bold),
//                                   //     )
//                                   //   ],
//                                   // )
//                                 ],
//                               )
