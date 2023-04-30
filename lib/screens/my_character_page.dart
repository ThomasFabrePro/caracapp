import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/widgets/blocs/caracteristics_bloc.dart';
import 'package:caracapp/widgets/blocs/inventory_bloc.dart';
import 'package:caracapp/widgets/blocs/jutsus_bloc.dart';
import 'package:caracapp/widgets/blocs/photo_bloc.dart';
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
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
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
                child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
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
                InventoryBloc(character: widget.character),
                const SizedBox(height: 20),
                Divider(
                    endIndent: width * 0.1,
                    indent: width * 0.1,
                    color: Colors.white,
                    thickness: 2),
                JutsuBloc(
                  character: widget.character,
                  updateBlocOntimer: false,
                ),
                const SizedBox(height: 20),
              ],
            )),
          ],
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
