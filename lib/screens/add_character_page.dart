import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/utils/data_access_object/character_dao.dart';
import 'package:caracapp/widgets/blocs/attribute_bloc.dart';
import 'package:caracapp/widgets/blocs/caracteristics_upgrade_bloc.dart';
import 'package:caracapp/widgets/blocs/elements_bloc.dart';
import 'package:caracapp/widgets/blocs/infos_bloc.dart';
import 'package:caracapp/widgets/blocs/inventory_bloc.dart';
import 'package:caracapp/widgets/blocs/jutsus_bloc.dart';
import 'package:caracapp/widgets/blocs/photo_bloc.dart';
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
          child: Stack(
            children: [
              SizedBox(
                width: width,
                height: height,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Image.asset(
                    "assets/front/background2.jpg",
                  ),
                ),
              ),
              SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: <Widget>[
                      //!FORMULAIRE
                      // TODO ADD FOCUS NODES
                      InfosBloc(widget.character, textFieldWidthPercent),
                      //?STOP FORMULAIRE
                      //! PHOTO
                      PhotoBloc(widget.character),
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
                        child: CaracteristicsUpgradeBloc(
                            character: widget.character),
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
                      Divider(
                        endIndent: width * 0.1,
                        indent: width * 0.1,
                        color: Colors.white,
                        thickness: 2,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 20.0, top: 10),
                        child: Text("Éléments",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 16.0, left: 16.0, right: 16.0),
                        child: ElementBloc(character: widget.character),
                      ),
                      //?STOP ELEMENT
                      const SizedBox(
                        height: 20,
                      ),
                      //!JUTSUS
                      Divider(
                        endIndent: width * 0.1,
                        indent: width * 0.1,
                        color: Colors.white,
                        thickness: 2,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text("Jutsus",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 16.0, left: 16.0, right: 16.0),
                        child: JutsuBloc(character: widget.character),
                      ),
                      //?STOP ELEMENT
                      const SizedBox(
                        height: 20,
                      ),
                      //!INVENTORY
                      Divider(
                        endIndent: width * 0.1,
                        indent: width * 0.1,
                        color: Colors.white,
                        thickness: 2,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: Text("Inventaire",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 16.0, left: 16.0, right: 16.0),
                        child: InventoryBloc(character: widget.character),
                      ),
                      //?STOP INVENTORY
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
