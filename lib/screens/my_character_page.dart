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
                JutsuBloc(
                  character: widget.character,
                  canDice: true,
                ),
                const SizedBox(height: 20),
                Divider(
                    endIndent: width * 0.1,
                    indent: width * 0.1,
                    color: Colors.white,
                    thickness: 2),
                InventoryBloc(character: widget.character),
                const SizedBox(height: 20),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
