import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/widgets/blocs/free_dices_bloc.dart';

import 'package:flutter/material.dart';

class FreeDicesPage extends StatefulWidget {
  final Character character;
  const FreeDicesPage({super.key, required this.character});

  @override
  State<FreeDicesPage> createState() => _FreeDicesPageState();
}

class _FreeDicesPageState extends State<FreeDicesPage> {
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
        child: Center(
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
              FreeDicesBloc(character: widget.character),
            ],
          ),
        ),
      ),
    );
  }
}
