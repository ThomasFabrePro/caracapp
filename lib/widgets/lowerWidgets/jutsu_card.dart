import 'dart:async';
import 'dart:math';

import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/widgets/lowerWidgets/dice_button.dart';
import 'package:flutter/material.dart';

class JutsuCard extends StatefulWidget {
  final Character character;
  final Jutsu jutsu;
  final int statValue;
  final bool isGenjutsu;
  final int chakra;
  final bool hideIfNotLearned;
  final int minimumStat;
  final int malus;
  final String statName;
  final bool enableDice;
  const JutsuCard(
      {super.key,
      this.isGenjutsu = false,
      this.malus = 0,
      this.enableDice = true,
      required this.jutsu,
      required this.minimumStat,
      required this.statName,
      required this.hideIfNotLearned,
      required this.chakra,
      required this.statValue,
      required this.character});

  @override
  State<JutsuCard> createState() => _JutsuCardState();
}

class _JutsuCardState extends State<JutsuCard> {
  bool _showFrontSide = true;
  bool _showDice = true;
  Widget _buildFront() {
    return __buildLayout(
      key: const ValueKey(true),
      jutsu: widget.jutsu,
      paddingValues: 0,
      isAvailable: widget.minimumStat <= widget.statValue,
      showDescription: false,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget _buildRear() {
    return __buildLayout(
      key: const ValueKey(false),
      jutsu: widget.jutsu,
      paddingValues: 0,
      isAvailable: widget.minimumStat <= widget.statValue,
      showDescription: true,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget __buildLayout({
    required Key key,
    required Jutsu jutsu,
    required double paddingValues,
    required double width,
    required bool isAvailable,
    required bool showDescription,
  }) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.asset(jutsu.image),
                ),
              ),
            ),
            Expanded(
              child: showDescription
                  ? Padding(
                      padding: const EdgeInsets.only(
                          top: 7.0, bottom: 2.0, right: 7.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(jutsu.name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          Text(
                            jutsu.description,
                            style: MyDecoration.dataStyle,
                          ),
                        ],
                      ),
                    )
                  : Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(jutsu.name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 18,
                              child: FittedBox(
                                child: Text(
                                    "Prérequis : ${widget.statName} ≥ ${jutsu.ninjutsuMinimum}",
                                    style: TextStyle(
                                      color: isAvailable
                                          ? Colors.black
                                          : Colors.red,
                                      fontSize: 18,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 18,
                              child: FittedBox(
                                child: Text("Coût Chakra : ${jutsu.chakraCost}",
                                    style: TextStyle(
                                      color:
                                          widget.chakra - jutsu.chakraCost < 0
                                              ? Colors.red
                                              : Colors.black,
                                      fontSize: 18,
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 18,
                              child: FittedBox(
                                child: Text("Malus au dé : ${jutsu.malus}",
                                    style: MyDecoration.dataStyle),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
            )
          ]),
          Container(
            width: width,
            height: 90,
            decoration: BoxDecoration(
              color: isAvailable && widget.chakra >= jutsu.chakraCost
                  ? null
                  : Colors.grey[900]!.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFlipAnimation() {
    Timer? timer;

    return Stack(
      children: [
        GestureDetector(
          onTap: () async {
            timer?.cancel();
            timer = Timer(const Duration(milliseconds: 500), () {
              setState(() => _showDice = true);
            });
            setState(() {
              _showDice = false;
              _showFrontSide = !_showFrontSide;
            });
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: __transitionBuilder,
            layoutBuilder: (widget, list) =>
                Stack(children: [widget!, ...list]),
            child: _showFrontSide ? _buildFront() : _buildRear(),
          ),
        ),
        _showDice && _showFrontSide && widget.enableDice
            ? Positioned(
                right: 10,
                bottom: 10,
                child: DiceButton(
                  character: widget.character,
                  title: widget.jutsu.name,
                  stat: widget.statValue,
                  buffer: 0,
                  malus: widget.malus,
                  isEnabled: widget.minimumStat <= widget.statValue &&
                      widget.chakra >= widget.jutsu.chakraCost,
                  additionalBehavior: () async {
                    widget.character.chakra -= widget.jutsu.chakraCost;
                    await widget.character.setChakra(widget.character.chakra);
                  },
                ),
              )
            : const SizedBox()
      ],
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget!.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationX(value)..setEntry(0, 3, tilt),
          alignment: Alignment.center,
          child: widget,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double containerHeight = 90;

    return widget.hideIfNotLearned
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: width,
              height: containerHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: _buildFlipAnimation(),
            ),
          )
        : const SizedBox();
  }
}
