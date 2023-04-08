import 'package:caracapp/database/db_helper.dart';
import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/widgets/lowerWidgets/upgrade_caracteritic.dart';
import 'package:flutter/material.dart';

class CaracteristicsUpgradeBloc extends StatefulWidget {
  final Character character;
  const CaracteristicsUpgradeBloc({super.key, required this.character});

  @override
  State<CaracteristicsUpgradeBloc> createState() =>
      _CaracteristicsUpgradeBlocState();
}

class _CaracteristicsUpgradeBlocState extends State<CaracteristicsUpgradeBloc> {
  Function update = () {};
  @override
  void initState() {
    update =
        () async => await DbHelper.database.updateCharacter(widget.character);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = double.infinity;
    return Container(
      width: width,
      // height: 200,
      // color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [MyDecoration.boxShadow],
      ),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              UpgradeCaracteristic(
                  title: "HP",
                  stat: widget.character.hp,
                  onTap: (int value) async {
                    widget.character.hp += value;
                    await widget.character.setHp(widget.character.hp);
                  }),
              UpgradeCaracteristic(
                  title: "Constitution",
                  stat: widget.character.constitution,
                  onTap: (int value) async {
                    widget.character.constitution += value;
                    await widget.character
                        .setConstitution(widget.character.constitution);
                  }),
              UpgradeCaracteristic(
                  title: "Chance",
                  stat: widget.character.luck,
                  onTap: (int value) async {
                    widget.character.luck += value;
                    await widget.character.setLuck(widget.character.luck);
                  }),
              UpgradeCaracteristic(
                  title: "Perception",
                  stat: widget.character.perception,
                  onTap: (int value) async {
                    widget.character.perception += value;
                    await widget.character
                        .setPerception(widget.character.perception);
                  }),
              UpgradeCaracteristic(
                  title: "Chakra",
                  stat: widget.character.chakra,
                  onTap: (int value) async {
                    widget.character.chakra += value;
                    await widget.character.setChakra(widget.character.chakra);
                  }),
              UpgradeCaracteristic(
                  title: "Esq/Bloc",
                  stat: widget.character.dodge,
                  onTap: (int value) async {
                    widget.character.dodge += value;
                    await widget.character.setDodge(widget.character.dodge);
                  }),
              UpgradeCaracteristic(
                  title: "Lancer",
                  stat: widget.character.throwing,
                  onTap: (int value) async {
                    widget.character.throwing += value;
                    await widget.character
                        .setThrowing(widget.character.throwing);
                  }),
              UpgradeCaracteristic(
                  title: "Ninjutsu",
                  stat: widget.character.ninjutsu,
                  onTap: (int value) async {
                    widget.character.ninjutsu += value;
                    await widget.character
                        .setNinjutsu(widget.character.ninjutsu);
                  }),
              UpgradeCaracteristic(
                  title: "Taijutsu",
                  stat: widget.character.taijutsu,
                  onTap: (int value) async {
                    widget.character.taijutsu += value;
                    await widget.character
                        .setTaijutsu(widget.character.taijutsu);
                  }),
              UpgradeCaracteristic(
                  title: "Genjutsu",
                  stat: widget.character.genjutsu,
                  onTap: (int value) async {
                    widget.character.genjutsu += value;
                    await widget.character
                        .setGenjutsu(widget.character.genjutsu);
                  }),
            ],
          )),
    );
  }
}
