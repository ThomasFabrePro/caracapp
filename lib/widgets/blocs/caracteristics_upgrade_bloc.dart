import 'package:caracapp/models/character_model.dart';
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
    double width = double.infinity;
    return Column(
      children: [
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
                            UpgradeCaracteristic(
                                title: "HP Max",
                                stat: widget.character.hpMax,
                                isEditable: isEditable,
                                buffer: widget.character.hpBuffer,
                                onTap: (int value) async {
                                  widget.character.hpMax += value;
                                  // (widget.character.hpMax + value).clamp(30, 100);
                                  await widget.character
                                      .setHpMax(widget.character.hpMax);
                                }),
                            UpgradeCaracteristic(
                                title: "Constitution",
                                isEditable: isEditable,
                                stat: widget.character.constitution,
                                buffer: widget.character.constitutionBuffer,
                                onTap: (int value) async {
                                  widget.character.constitution += value;
                                  // (widget.character.constitution + value)
                                  //     .clamp(30, 100);
                                  await widget.character.setConstitution(
                                      widget.character.constitution);
                                }),
                            UpgradeCaracteristic(
                                title: "Chance",
                                isEditable: isEditable,
                                stat: widget.character.luck,
                                buffer: widget.character.luckBuffer,
                                onTap: (int value) async {
                                  widget.character.luck += value;
                                  // (widget.character.luck + value).clamp(30, 100);
                                  await widget.character
                                      .setLuck(widget.character.luck);
                                }),
                            UpgradeCaracteristic(
                                title: "Perception",
                                isEditable: isEditable,
                                stat: widget.character.perception,
                                buffer: widget.character.perceptionBuffer,
                                onTap: (int value) async {
                                  widget.character.perception += value;
                                  // (widget.character.perception + value)
                                  //     .clamp(30, 100);
                                  await widget.character.setPerception(
                                      widget.character.perception);
                                }),
                            UpgradeCaracteristic(
                                title: "Chakra Max",
                                isEditable: isEditable,
                                stat: widget.character.chakraMax,
                                buffer: widget.character.chakraBuffer,
                                onTap: (int value) async {
                                  widget.character.chakraMax += value;
                                  // (snapshot.data!.chakraMax + value).clamp(30, 100);
                                  await widget.character
                                      .setChakraMax(widget.character.chakraMax);
                                }),
                            UpgradeCaracteristic(
                                title: "Esq/Bloc",
                                isEditable: isEditable,
                                stat: widget.character.dodge,
                                buffer: widget.character.dodgeBuffer,
                                onTap: (int value) async {
                                  widget.character.dodge += value;
                                  // (widget.character.dodge + value).clamp(30, 100);
                                  await widget.character
                                      .setDodge(widget.character.dodge);
                                }),
                            UpgradeCaracteristic(
                                title: "Lancer",
                                isEditable: isEditable,
                                stat: widget.character.throwing,
                                buffer: widget.character.throwingBuffer,
                                onTap: (int value) async {
                                  widget.character.throwing += value;
                                  // (widget.character.throwing + value)
                                  //     .clamp(30, 100);
                                  await widget.character
                                      .setThrowing(widget.character.throwing);
                                }),
                            UpgradeCaracteristic(
                                title: "Ninjutsu",
                                isEditable: isEditable,
                                stat: widget.character.ninjutsu,
                                buffer: widget.character.ninjutsuBuffer,
                                onTap: (int value) async {
                                  widget.character.ninjutsu += value;
                                  // (widget.character.ninjutsu + value)
                                  //     .clamp(30, 100);
                                  await widget.character
                                      .setNinjutsu(widget.character.ninjutsu);
                                }),
                            UpgradeCaracteristic(
                                title: "Taijutsu",
                                isEditable: isEditable,
                                stat: widget.character.taijutsu,
                                buffer: widget.character.taijutsuBuffer,
                                onTap: (int value) async {
                                  widget.character.taijutsu += value;
                                  // (widget.character.taijutsu + value)
                                  //     .clamp(30, 100);
                                  await widget.character
                                      .setTaijutsu(widget.character.taijutsu);
                                }),
                            UpgradeCaracteristic(
                                title: "Genjutsu",
                                isEditable: isEditable,
                                stat: widget.character.genjutsu,
                                buffer: widget.character.genjutsuBuffer,
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
            ))
      ],
    );
  }
}
