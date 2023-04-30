import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/widgets/lowerWidgets/dice_caracteristic.dart';
import 'package:caracapp/widgets/lowerWidgets/upgrade_caracteristic.dart';
import 'package:flutter/material.dart';

class CaracteristicsBloc extends StatefulWidget {
  final Character character;
  final bool isEditable;
  const CaracteristicsBloc({
    super.key,
    required this.character,
    this.isEditable = true,
  });

  @override
  State<CaracteristicsBloc> createState() => _CaracteristicsBlocState();
}

class _CaracteristicsBlocState extends State<CaracteristicsBloc> {
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
    // double width = double.infinity;
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
          padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
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
                          title: "HP",
                          stat: widget.character.hp,
                          onMaxValue: widget.character.hpMax,
                          isEditable: true,
                          buffer: widget.character.hpBuffer,
                          minValue: 0,
                          cantAddMoreThan:
                              widget.character.hp >= widget.character.hpMax,
                          onTap: (int value) async {
                            widget.character.hp = (widget.character.hp + value)
                                .clamp(0, widget.character.hpMax);
                            await widget.character.setHp(widget.character.hp);
                          }),
                      UpgradeCaracteristic(
                          title: "Chakra",
                          onMaxValue: widget.character.chakraMax,
                          stat: widget.character.chakra,
                          buffer: widget.character.chakraBuffer,
                          minValue: 0,
                          cantAddMoreThan: widget.character.chakra >=
                              widget.character.chakraMax,
                          isEditable: true,
                          onTap: (int value) async {
                            widget.character.chakra =
                                (widget.character.chakra + value)
                                    .clamp(0, widget.character.chakraMax);
                            await widget.character
                                .setChakra(widget.character.chakra);
                          }),
                      DiceCaracteristic(
                          character: widget.character,
                          title: "Constitution",
                          stat: widget.character.constitution,
                          buffer: widget.character.constitutionBuffer,
                          onTap: (int value) async {
                            widget.character.constitution += value;
                            // (widget.character.constitution + value)
                            //     .clamp(30, 100);
                            await widget.character
                                .setConstitution(widget.character.constitution);
                          }),
                      DiceCaracteristic(
                          character: widget.character,
                          title: "Chance",
                          stat: widget.character.luck,
                          buffer: widget.character.luckBuffer,
                          onTap: (int value) async {
                            widget.character.luck += value;
                            // (widget.character.luck + value).clamp(30, 100);
                            await widget.character
                                .setLuck(widget.character.luck);
                          }),
                      DiceCaracteristic(
                          character: widget.character,
                          title: "Perception",
                          stat: widget.character.perception,
                          buffer: widget.character.perceptionBuffer,
                          onTap: (int value) async {
                            widget.character.perception += value;
                            // (widget.character.perception + value)
                            //     .clamp(30, 100);
                            await widget.character
                                .setPerception(widget.character.perception);
                          }),
                      DiceCaracteristic(
                          character: widget.character,
                          title: "Esq/Bloc",
                          stat: widget.character.dodge,
                          buffer: widget.character.dodgeBuffer,
                          onTap: (int value) async {
                            widget.character.dodge += value;
                            // (widget.character.dodge + value).clamp(30, 100);
                            await widget.character
                                .setDodge(widget.character.dodge);
                          }),
                      DiceCaracteristic(
                          character: widget.character,
                          title: "Lancer",
                          stat: widget.character.throwing,
                          buffer: widget.character.throwingBuffer,
                          onTap: (int value) async {
                            widget.character.throwing += value;
                            // (widget.character.throwing + value)
                            //     .clamp(30, 100);
                            await widget.character
                                .setThrowing(widget.character.throwing);
                          }),
                      DiceCaracteristic(
                          character: widget.character,
                          title: "Ninjutsu",
                          stat: widget.character.ninjutsu,
                          buffer: widget.character.ninjutsuBuffer,
                          onTap: (int value) async {
                            widget.character.ninjutsu += value;
                            // (widget.character.ninjutsu + value)
                            //     .clamp(30, 100);
                            await widget.character
                                .setNinjutsu(widget.character.ninjutsu);
                          }),
                      DiceCaracteristic(
                          character: widget.character,
                          title: "Taijutsu",
                          stat: widget.character.taijutsu,
                          buffer: widget.character.taijutsuBuffer,
                          onTap: (int value) async {
                            widget.character.taijutsu += value;
                            // (widget.character.taijutsu + value)
                            //     .clamp(30, 100);
                            await widget.character
                                .setTaijutsu(widget.character.taijutsu);
                          }),
                      DiceCaracteristic(
                          character: widget.character,
                          title: "Genjutsu",
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
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
