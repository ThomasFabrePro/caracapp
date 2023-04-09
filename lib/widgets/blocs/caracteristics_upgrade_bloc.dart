import 'dart:math';

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
  Stream<Character> getCharacterStats() async* {
    // var random = Random(2);
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield widget.character;
    }
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
          child: StreamBuilder<Character>(
              stream: getCharacterStats(),
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    UpgradeCaracteristic(
                        title: "HP",
                        stat: widget.character.hp,
                        onTap: (int value) async {
                          widget.character.hp += value;
                          // (widget.character.hp + value).clamp(30, 100);
                          await widget.character.setHp(widget.character.hp);
                        }),
                    UpgradeCaracteristic(
                        title: "Constitution",
                        stat: widget.character.constitution,
                        onTap: (int value) async {
                          widget.character.constitution += value;
                          // (widget.character.constitution + value)
                          //     .clamp(30, 100);
                          await widget.character
                              .setConstitution(widget.character.constitution);
                        }),
                    UpgradeCaracteristic(
                        title: "Chance",
                        stat: widget.character.luck,
                        onTap: (int value) async {
                          widget.character.luck += value;
                          // (widget.character.luck + value).clamp(30, 100);
                          await widget.character.setLuck(widget.character.luck);
                        }),
                    UpgradeCaracteristic(
                        title: "Perception",
                        stat: widget.character.perception,
                        onTap: (int value) async {
                          widget.character.perception += value;
                          // (widget.character.perception + value)
                          //     .clamp(30, 100);
                          await widget.character
                              .setPerception(widget.character.perception);
                        }),
                    UpgradeCaracteristic(
                        title: "Chakra",
                        stat: widget.character.chakra,
                        onTap: (int value) async {
                          widget.character.chakra += value;
                          // (snapshot.data!.chakra + value).clamp(30, 100);
                          await widget.character
                              .setChakra(widget.character.chakra);
                        }),
                    UpgradeCaracteristic(
                        title: "Esq/Bloc",
                        stat: widget.character.dodge,
                        onTap: (int value) async {
                          widget.character.dodge += value;
                          // (widget.character.dodge + value).clamp(30, 100);
                          await widget.character
                              .setDodge(widget.character.dodge);
                        }),
                    UpgradeCaracteristic(
                        title: "Lancer",
                        stat: widget.character.throwing,
                        onTap: (int value) async {
                          widget.character.throwing += value;
                          // (widget.character.throwing + value)
                          //     .clamp(30, 100);
                          await widget.character
                              .setThrowing(widget.character.throwing);
                        }),
                    UpgradeCaracteristic(
                        title: "Ninjutsu",
                        stat: widget.character.ninjutsu,
                        onTap: (int value) async {
                          widget.character.ninjutsu += value;
                          // (widget.character.ninjutsu + value)
                          //     .clamp(30, 100);
                          await widget.character
                              .setNinjutsu(widget.character.ninjutsu);
                        }),
                    UpgradeCaracteristic(
                        title: "Taijutsu",
                        stat: widget.character.taijutsu,
                        onTap: (int value) async {
                          widget.character.taijutsu += value;
                          // (widget.character.taijutsu + value)
                          //     .clamp(30, 100);
                          await widget.character
                              .setTaijutsu(widget.character.taijutsu);
                        }),
                    UpgradeCaracteristic(
                        title: "Genjutsu",
                        stat: widget.character.genjutsu,
                        onTap: (int value) async {
                          widget.character.genjutsu += value;
                          // (widget.character.genjutsu + value)
                          //     .clamp(30, 100);
                          await widget.character
                              .setGenjutsu(widget.character.genjutsu);
                        }),
                  ],
                );
              })),
    );
  }
}
