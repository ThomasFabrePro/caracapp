import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/widgets/lowerWidgets/upgrade_caracteristic.dart';
import 'package:flutter/material.dart';

class CaracteristicsUpgradeBloc extends StatefulWidget {
  final Character character;
  final bool isEditable;
  const CaracteristicsUpgradeBloc({
    super.key,
    required this.character,
    this.isEditable = true,
  });

  @override
  State<CaracteristicsUpgradeBloc> createState() =>
      _CaracteristicsUpgradeBlocState();
}

class _CaracteristicsUpgradeBlocState extends State<CaracteristicsUpgradeBloc> {
  late bool isEditable;
  @override
  void initState() {
    super.initState();
    isEditable = widget.isEditable;
  }

  Stream<Character> getCharacterStats() async* {
    // var random = Random(2);
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield widget.character;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("CaracteristicsBloc build");
    double width = double.infinity;
    return Column(
      children: [
        Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),
            width: width,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 20,
                ),
                child: Text("Caractéristiques",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
          ),
        ),
        Padding(
            padding:
                const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 1000,
              ),
              // width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder<Character>(
                      stream: getCharacterStats(),
                      builder: (context, snapshot) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Container(
                                height: 40,
                                color: const Color.fromARGB(172, 255, 255, 255),
                                child: Center(
                                  child: Text(
                                    "Points restants: ${widget.character.pointsLeftToSpend}",
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: MyDecoration.bloodColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            UpgradeCaracteristic(
                                title: "HP Max",
                                stat: widget.character.hpMax,
                                isEditable: isEditable,
                                isMax: widget.character.pointsLeftToSpend == 0,
                                buffer: widget.character.hpBuffer,
                                onTap: (int value) async {
                                  if (widget.character.pointsLeftToSpend +
                                          (-value) <
                                      0) {
                                    return;
                                  }
                                  //!Ne pas mettre dans le widget car casse CararcteristicsBloc
                                  widget.character.hpMax += value;
                                  widget.character.pointsLeftToSpend +=
                                      (-value);
                                  await widget.character
                                      .setHpMax(widget.character.hpMax);
                                }),
                            UpgradeCaracteristic(
                                title: "Constitution",
                                isEditable: isEditable,
                                isMax: widget.character.pointsLeftToSpend == 0,
                                stat: widget.character.constitution,
                                buffer: widget.character.constitutionBuffer,
                                onTap: (int value) async {
                                  if (widget.character.pointsLeftToSpend +
                                          (-value) <
                                      0) {
                                    return;
                                  }
                                  widget.character.constitution += value;
                                  widget.character.pointsLeftToSpend +=
                                      (-value);
                                  // (widget.character.constitution + value)
                                  //     .clamp(30, 100);
                                  await widget.character.setConstitution(
                                      widget.character.constitution);
                                }),
                            UpgradeCaracteristic(
                                title: "Chance",
                                isEditable: isEditable,
                                isMax: widget.character.pointsLeftToSpend == 0,
                                stat: widget.character.luck,
                                buffer: widget.character.luckBuffer,
                                onTap: (int value) async {
                                  if (widget.character.pointsLeftToSpend +
                                          (-value) <
                                      0) {
                                    return;
                                  }
                                  widget.character.luck += value;
                                  widget.character.pointsLeftToSpend +=
                                      (-value);
                                  // (widget.character.luck + value).clamp(30, 100);
                                  await widget.character
                                      .setLuck(widget.character.luck);
                                }),
                            UpgradeCaracteristic(
                                title: "Perception",
                                isEditable: isEditable,
                                isMax: widget.character.pointsLeftToSpend == 0,
                                stat: widget.character.perception,
                                buffer: widget.character.perceptionBuffer,
                                onTap: (int value) async {
                                  if (widget.character.pointsLeftToSpend +
                                          (-value) <
                                      0) {
                                    return;
                                  }
                                  widget.character.perception += value;
                                  widget.character.pointsLeftToSpend +=
                                      (-value);
                                  // (widget.character.perception + value)
                                  //     .clamp(30, 100);
                                  await widget.character.setPerception(
                                      widget.character.perception);
                                }),
                            UpgradeCaracteristic(
                                title: "Chakra Max",
                                isEditable: isEditable,
                                isMax: widget.character.pointsLeftToSpend == 0,
                                stat: widget.character.chakraMax,
                                buffer: widget.character.chakraBuffer,
                                onTap: (int value) async {
                                  if (widget.character.pointsLeftToSpend +
                                          (-value) <
                                      0) {
                                    return;
                                  }
                                  widget.character.chakraMax += value;
                                  widget.character.pointsLeftToSpend +=
                                      (-value);
                                  // (snapshot.data!.chakraMax + value).clamp(30, 100);
                                  await widget.character
                                      .setChakraMax(widget.character.chakraMax);
                                }),
                            UpgradeCaracteristic(
                                title: "Esq/Bloc",
                                isMax: widget.character.pointsLeftToSpend == 0,
                                isEditable: isEditable,
                                stat: widget.character.dodge,
                                buffer: widget.character.dodgeBuffer,
                                onTap: (int value) async {
                                  if (widget.character.pointsLeftToSpend +
                                          (-value) <
                                      0) {
                                    return;
                                  }
                                  widget.character.dodge += value;
                                  widget.character.pointsLeftToSpend +=
                                      (-value);
                                  // (widget.character.dodge + value).clamp(30, 100);
                                  await widget.character
                                      .setDodge(widget.character.dodge);
                                }),
                            UpgradeCaracteristic(
                                title: "Lancer",
                                isMax: widget.character.pointsLeftToSpend == 0,
                                isEditable: isEditable,
                                stat: widget.character.throwing,
                                buffer: widget.character.throwingBuffer,
                                onTap: (int value) async {
                                  if (widget.character.pointsLeftToSpend +
                                          (-value) <
                                      0) {
                                    return;
                                  }
                                  widget.character.throwing += value;
                                  widget.character.pointsLeftToSpend +=
                                      (-value);
                                  // (widget.character.throwing + value)
                                  //     .clamp(30, 100);
                                  await widget.character
                                      .setThrowing(widget.character.throwing);
                                }),
                            UpgradeCaracteristic(
                                title: "Ninjutsu",
                                isEditable: isEditable,
                                isMax: widget.character.pointsLeftToSpend == 0,
                                stat: widget.character.ninjutsu,
                                buffer: widget.character.ninjutsuBuffer,
                                onTap: (int value) async {
                                  if (widget.character.pointsLeftToSpend +
                                          (-value) <
                                      0) {
                                    return;
                                  }
                                  widget.character.ninjutsu += value;
                                  widget.character.pointsLeftToSpend +=
                                      (-value);
                                  // (widget.character.ninjutsu + value)
                                  //     .clamp(30, 100);
                                  await widget.character
                                      .setNinjutsu(widget.character.ninjutsu);
                                }),
                            UpgradeCaracteristic(
                                title: "Taijutsu",
                                isEditable: isEditable,
                                stat: widget.character.taijutsu,
                                isMax: widget.character.pointsLeftToSpend == 0,
                                buffer: widget.character.taijutsuBuffer,
                                onTap: (int value) async {
                                  if (widget.character.pointsLeftToSpend +
                                          (-value) <
                                      0) {
                                    return;
                                  }
                                  widget.character.taijutsu += value;
                                  widget.character.pointsLeftToSpend +=
                                      (-value);
                                  // (widget.character.taijutsu + value)
                                  //     .clamp(30, 100);
                                  await widget.character
                                      .setTaijutsu(widget.character.taijutsu);
                                }),
                            UpgradeCaracteristic(
                                title: "Genjutsu",
                                isEditable: isEditable,
                                isMax: widget.character.pointsLeftToSpend == 0,
                                stat: widget.character.genjutsu,
                                buffer: widget.character.genjutsuBuffer,
                                onTap: (int value) async {
                                  if (widget.character.pointsLeftToSpend +
                                          (-value) <
                                      0) {
                                    return;
                                  }
                                  widget.character.genjutsu += value;
                                  widget.character.pointsLeftToSpend +=
                                      (-value);
                                  // (widget.character.genjutsu + value)
                                  //     .clamp(30, 100);
                                  await widget.character
                                      .setGenjutsu(widget.character.genjutsu);
                                }),
                          ],
                        );
                      })),
            ))
      ],
    );
  }
}
