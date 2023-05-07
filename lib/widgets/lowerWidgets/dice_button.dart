import 'dart:math' show Random, pi, min;

import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class DiceButton extends StatefulWidget {
  final Character character;
  final String title;
  final int stat;
  final int buffer;
  final int malus;
  final bool isEnabled;
  final Function? additionalBehavior;
  const DiceButton({
    super.key,
    this.malus = 0,
    this.isEnabled = true,
    required this.stat,
    required this.buffer,
    required this.character,
    required this.title,
    this.additionalBehavior,
  });

  @override
  State<DiceButton> createState() => _DiceButtonState();
}

class _DiceButtonState extends State<DiceButton> {
  bool _showFrontSide = true;
  String result = "";
  Color textColor = Colors.black;
  Function? additionalBehavior;
  @override
  void initState() {
    super.initState();
    additionalBehavior = widget.additionalBehavior;
  }

  Widget _buildFront() {
    return __buildLayout(
      key: const ValueKey(true),
      showResult: false,
      width: MediaQuery.of(context).size.width,
      textColor: Colors.black, //inutile
    );
  }

  Widget _buildRear(String resultOne, Color textColorOne) {
    return __buildLayout(
      key: const ValueKey(false),
      showResult: true,
      width: MediaQuery.of(context).size.width,
      result: resultOne,
      textColor: textColorOne,
    );
  }

  Widget __buildLayout({
    required Key key,
    String result = "",
    required Color textColor,
    required double width,
    required bool showResult,
  }) {
    return Container(
      key: key,
      constraints: const BoxConstraints(minWidth: 100),
      height: 30,
      decoration: BoxDecoration(
        color: showResult ? Colors.white : MyDecoration.bloodColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: showResult
            ? FittedBox(
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              )
            : const Text(
                "Jet de dé",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  Widget _buildFlipAnimation() {
    int malus = widget.malus;
    return GestureDetector(
      onTap: () async {
        if (widget.isEnabled) {
          if (_showFrontSide && widget.isEnabled) {
            int randomInt = Random().nextInt(101);
            result = "$randomInt";
            int definitveStat = widget.stat + widget.buffer - malus;
            if (randomInt <= 5) {
              textColor = const Color.fromARGB(255, 182, 164, 0);
              result += " succès crit.";
            } else if (randomInt >= 95) {
              textColor = MyDecoration.bloodColor;
              result += " échec crit.";
            } else if (randomInt > definitveStat) {
              textColor = Colors.red;
              result += " échec";
            } else {
              textColor = Colors.green;
              result += " succès";
            }
            String malusValueAsString = "";
            String malusText = "";
            if (malus >= 0) {
              malusValueAsString = "- $malus";
              malusText = "Malus : ${malus.abs()}";
            } else {
              malusValueAsString = "+ ${-(malus)}";
              malusText = "Bonus : ${malus.abs()}";
            }
            widget.character.addToLogsAndUpdate(" Jet de ${widget.title}\n"
                " $malusText\n"
                " Max requis : ${widget.stat + widget.buffer} $malusValueAsString = $definitveStat\n"
                " Score du dé : $result");
            additionalBehavior?.call();
          }

          setState(() {
            _showFrontSide = !_showFrontSide;
          });
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        child: _showFrontSide ? _buildFront() : _buildRear(result, textColor),
        // switchInCurve: Curves.easeInBack,
        // switchOutCurve: Curves.easeOutBack,
      ),
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
    return _buildFlipAnimation();
  }
}
