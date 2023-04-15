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
          color: Color.fromARGB(255, 0, 0, 0),
          // color: Colors.green,
          // decoration: const BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topRight,
          //   end: Alignment.bottomLeft,
          //   colors: [
          //     // Color.fromARGB(255, 73, 223, 78),
          //     // Color.fromARGB(255, 33, 243, 191),
          //     Color.fromARGB(255, 190, 0, 0),
          //     Color.fromARGB(255, 0, 0, 0),
          //   ],
          // ),
          // ),
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
                  controller: scrollController,
                  child: Column(
                    children: <Widget>[
                      // TODO ADD FOCUS NODES
                      InfosBloc(widget.character, textFieldWidthPercent),

                      PhotoBloc(widget.character),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        endIndent: width * 0.1,
                        indent: width * 0.1,
                        color: Colors.white,
                        thickness: 2,
                      ),

                      CaracteristicsUpgradeBloc(character: widget.character),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        endIndent: width * 0.1,
                        indent: width * 0.1,
                        color: Colors.white,
                        thickness: 2,
                      ),

                      AttributeBloc(
                          character: widget.character,
                          scrollController: scrollController),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        endIndent: width * 0.1,
                        indent: width * 0.1,
                        color: Colors.white,
                        thickness: 2,
                      ),

                      SpecialityBloc(character: widget.character),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        endIndent: width * 0.1,
                        indent: width * 0.1,
                        color: Colors.white,
                        thickness: 2,
                      ),

                      ElementBloc(character: widget.character),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        endIndent: width * 0.1,
                        indent: width * 0.1,
                        color: Colors.white,
                        thickness: 2,
                      ),

                      JutsuBloc(character: widget.character),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(
                        endIndent: width * 0.1,
                        indent: width * 0.1,
                        color: Colors.white,
                        thickness: 2,
                      ),

                      InventoryBloc(character: widget.character),
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
