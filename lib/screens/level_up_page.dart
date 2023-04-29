import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/widgets/blocs/caracteristics_upgrade_bloc.dart';

import 'package:flutter/material.dart';

class LevelUpPage extends StatefulWidget {
  final Character character;
  const LevelUpPage({super.key, required this.character});

  @override
  State<LevelUpPage> createState() => _LevelUpPageState();
}

class _LevelUpPageState extends State<LevelUpPage> {
  double textFieldWidthPercent = 0.65;

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        height: height,
        width: width,
        color: Color.fromARGB(255, 0, 0, 0),
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
              SingleChildScrollView(
                  child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      setState(() {
                        widget.character
                          ..level += 1
                          ..pointsLeftToSpend += 5;
                      });
                      await widget.character.setLevel(widget.character.level);
                      // await widget.character.setLevel(widget.character.level);
                      // await widget.character.setPointsLeftToSpend(
                      //     widget.character.pointsLeftToSpend);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                      child: Container(
                        width: width * 0.4,
                        height: 60,
                        decoration: BoxDecoration(
                          color: MyDecoration.bloodColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(
                                  2, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Passer\nNiveau ${widget.character.level + 1} !",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  CaracteristicsUpgradeBloc(
                    character: widget.character,
                  ),
                  const SizedBox(height: 20),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
