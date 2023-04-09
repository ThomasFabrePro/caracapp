import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/utils/data_access_object/character_dao.dart';
import 'package:caracapp/widgets/blocs/attribute_bloc.dart';
import 'package:caracapp/widgets/blocs/caracteristics_upgrade_bloc.dart';
import 'package:caracapp/widgets/blocs/speciality_bloc.dart';
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
  bool displayPhotosGrid = false;
  ScrollController scrollController = ScrollController();

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
                // Color.fromARGB(255, 73, 223, 78),
                // Color.fromARGB(255, 33, 243, 191),
                Color.fromARGB(255, 190, 0, 0),
                Color.fromARGB(255, 0, 0, 0),
              ],
            ),
          ),
          child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: <Widget>[
                  //!FORMULAIRE
                  // TODO ADD FOCUS NODES
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        MyTextField(
                          title: "Nom :",
                          hint: widget.character.name,
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
                          hint: widget.character.sexe,
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
                          hint: widget.character.origin,
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
                  //?STOP FORMULAIRE
                  //! PHOTO
                  Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8.0,
                        top: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Photo :",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                          ),

                          displayPhotosGrid
                              ? const SizedBox()
                              : Center(
                                  child: GestureDetector(
                                  onTap: () => setState(() {
                                    displayPhotosGrid = true;
                                  }),
                                  child: SizedBox(
                                      width: width * 0.4,
                                      height: width * 0.4,
                                      child: Image.asset(
                                          widget.character.picture)),
                                )),

                          //!Pour centrer la photo
                          const Text("Photo :",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.transparent)),
                        ],
                      )),
                  displayPhotosGrid
                      ? Container(
                          color: Colors.white,
                          child: GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            children: [
                              PickImage(
                                  imagePath:
                                      MyImages().imagePath[image.ninja1]!,
                                  onTap: (String value) {
                                    setState(() {
                                      widget.character.picture = value;
                                      widget.character.setPicture(value);
                                      displayPhotosGrid = false;
                                    });
                                  }),
                              PickImage(
                                  imagePath:
                                      MyImages().imagePath[image.ninja2]!,
                                  onTap: (String value) {
                                    setState(() {
                                      widget.character.picture = value;
                                      widget.character.setPicture(value);
                                      displayPhotosGrid = false;
                                    });
                                  }),
                              PickImage(
                                  imagePath:
                                      MyImages().imagePath[image.ninja3]!,
                                  onTap: (String value) {
                                    setState(() {
                                      widget.character.picture = value;
                                      widget.character.setPicture(value);
                                      displayPhotosGrid = false;
                                    });
                                  }),
                              PickImage(
                                  imagePath:
                                      MyImages().imagePath[image.ninja4]!,
                                  onTap: (String value) {
                                    setState(() {
                                      widget.character.picture = value;
                                      widget.character.setPicture(value);
                                      displayPhotosGrid = false;
                                    });
                                  }),
                              PickImage(
                                  imagePath:
                                      MyImages().imagePath[image.ninja5]!,
                                  onTap: (String value) {
                                    setState(() {
                                      widget.character.picture = value;
                                      widget.character.setPicture(value);
                                      displayPhotosGrid = false;
                                    });
                                  }),
                              PickImage(
                                  imagePath:
                                      MyImages().imagePath[image.ninja6]!,
                                  onTap: (String value) {
                                    setState(() {
                                      widget.character.picture = value;
                                      widget.character.setPicture(value);
                                      displayPhotosGrid = false;
                                    });
                                  }),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  //?STOP PHOTO
                  const SizedBox(
                    height: 20,
                  ),
                  //!CARACTERISTIQUES
                  Divider(
                    endIndent: width * 0.1,
                    indent: width * 0.1,
                    color: Colors.white,
                    thickness: 2,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20.0, top: 10),
                    child: Text("Caractéristiques",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 16.0, left: 16.0, right: 16.0),
                    child:
                        CaracteristicsUpgradeBloc(character: widget.character),
                  ),
                  //?STOP CARACTERISTIQUES
                  const SizedBox(
                    height: 20,
                  ),
                  //!ATTRIBUTE
                  Divider(
                    endIndent: width * 0.1,
                    indent: width * 0.1,
                    color: Colors.white,
                    thickness: 2,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20.0, top: 10),
                    child: Text("Attribut",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 16.0, left: 16.0, right: 16.0),
                    child: AttributeBloc(
                        character: widget.character,
                        scrollController: scrollController),
                  ),
                  //?STOP ATTRIBUTE
                  const SizedBox(
                    height: 20,
                  ),
                  //!SPECIALITE
                  // TODO ADD BUFFER SYSTEM
                  Divider(
                    endIndent: width * 0.1,
                    indent: width * 0.1,
                    color: Colors.white,
                    thickness: 2,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20.0, top: 10),
                    child: Text("Spécialité",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 16.0, left: 16.0, right: 16.0),
                    child: SpecialityBloc(
                      character: widget.character,
                    ),
                  ),

                  //?STOP SPECIALITE
                  const SizedBox(
                    height: 20,
                  ),
                  //!ELEMENT
                  //!ELEMENT
                  //!ELEMENT
                  //!ELEMENT
                  //!ELEMENT
                  //!ELEMENT
                  //!ELEMENT
                  //!ELEMENT
                  //!ELEMENT
                  //!ELEMENT
                ],
              )),
        ),
      ),
    );
  }
}

class PickImage extends StatefulWidget {
  final String imagePath;
  final Function onTap;

  const PickImage({super.key, required this.imagePath, required this.onTap});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(widget.imagePath);
      },
      child: SizedBox(
          width: 100,
          height: 100,
          child: Image(
            image: AssetImage(widget.imagePath),
          )),
    );
  }
}
