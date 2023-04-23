import 'package:caracapp/main.dart';
import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/screens/logs_page.dart';
import 'package:caracapp/screens/my_character_page.dart';
import 'package:caracapp/utils/color_theme.dart';
import 'package:caracapp/widgets/blocs/caracteristics_bloc.dart';
import 'package:caracapp/widgets/blocs/caracteristics_upgrade_bloc.dart';
import 'package:caracapp/widgets/blocs/infos_bloc.dart';
import 'package:caracapp/widgets/blocs/inventory_bloc.dart';
import 'package:caracapp/widgets/blocs/jutsus_bloc.dart';
import 'package:caracapp/widgets/blocs/navigator_bloc.dart';
import 'package:caracapp/widgets/blocs/photo_bloc.dart';
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
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyColorTheme.colorCustom,
          title: FittedBox(
              child: Text(
                  "${widget.character.name} de ${widget.character.origin}\n${widget.character.sexe} - ${widget.character.age} ans - level ${widget.character.level}")),
          leading: GestureDetector(
            onTap: () {
              // Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyCharacterPage(character: widget.character),
                    maintainState: false),
              );

              deactivate();
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
              child: Image.asset(
                "assets/front/back_arrow.jpg",
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
                      await widget.character.addToLogsAndUpdate(
                          "Level Up !\nTotal de points à dépenser : ${widget.character.pointsLeftToSpend}");
                      // await widget.character.setLevel(widget.character.level);
                      // await widget.character.setPointsLeftToSpend(
                      //     widget.character.pointsLeftToSpend);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                      child: Container(
                        color: Colors.white,
                        child: const Text(
                          "Level up",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
