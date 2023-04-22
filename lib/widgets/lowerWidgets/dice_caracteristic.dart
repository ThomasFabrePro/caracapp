import 'dart:math';

import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class DiceCaracteristic extends StatefulWidget {
  final Character character;
  final String title;
  final int stat;
  final int buffer;
  final Color? fontColor;
  final Function? onTap;
  const DiceCaracteristic(
      {super.key,
      this.fontColor,
      required this.title,
      required this.onTap,
      required this.stat,
      required this.buffer,
      required this.character});

  @override
  State<DiceCaracteristic> createState() => _DiceCaracteristicState();
}

class _DiceCaracteristicState extends State<DiceCaracteristic> {
  int stat = 0;
  int buffer = 0;
  String bufferText = "";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    stat = widget.stat;
    buffer = widget.buffer;
    if (buffer > 0) {
      bufferText = "(+$buffer)";
    } else {
      bufferText = "($buffer)";
    }
    double width = (MediaQuery.of(context).size.width).clamp(0, 1000);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: SizedBox(
        height: 40,
        // color: Colors.green,
        // constraints: const BoxConstraints(
        //   maxWidth: 1000,
        // ),
        child: Row(children: [
          SizedBox(
            width: width * 0.38,
            child: Text(widget.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyDecoration.bloodColor,
                  // color: widget.fontColor,
                  overflow: TextOverflow.ellipsis,
                )),
          ),
          SizedBox(
            width: width * 0.09,
            child: Text((stat + buffer).toString(),
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: buffer > 0
                      ? Colors.green
                      : buffer < 0
                          ? Colors.red
                          : Colors.black,
                )),
          ),
          buffer != 0
              ? SizedBox(
                  width: width * 0.11,
                  child: Text(bufferText, style: MyDecoration.dataStyle),
                )
              : SizedBox(width: width * 0.11),
          Expanded(
            child: DiceButton(
                character: widget.character,
                title: widget.title,
                width: width,
                stat: stat,
                buffer: buffer),
          ),
        ]),
      ),
    );
  }
}

class DiceButton extends StatefulWidget {
  final Character character;
  final String title;
  final double width;
  final int stat;
  final int buffer;
  const DiceButton(
      {super.key,
      required this.width,
      required this.stat,
      required this.buffer,
      required this.character,
      required this.title});

  @override
  State<DiceButton> createState() => _DiceButtonState();
}

class _DiceButtonState extends State<DiceButton> {
  bool _showFrontSide = true;
  String result = "";
  Color textColor = Colors.black;

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
    // required Jutsu jutsu,
    // required double paddingValues,
    // required double width,
    // required bool isAvailable,
    String result = "",
    required Color textColor,
    required double width,
    required bool showResult,
  }) {
    return Container(
      key: key,
      // width: width * 0.3,
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
    return GestureDetector(
      onTap: () {
        if (_showFrontSide) {
          int random = Random().nextInt(101);
          result = "$random";
          if (random <= 5) {
            textColor = Color.fromARGB(255, 182, 164, 0);
            result += " succès crit.";
          } else if (random >= 95) {
            textColor = MyDecoration.bloodColor;
            result += " échec crit.";
          } else if (random > (widget.stat + widget.buffer)) {
            textColor = Colors.red;
            result += " échec";
          } else {
            textColor = Colors.green;
            result += " succès";
          }
          widget.character.addToLogsAndUpdate("${widget.title} $result");
        }

        setState(() {
          _showFrontSide = !_showFrontSide;
        });
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
    double width = MediaQuery.of(context).size.width;
    double containerHeight = 90;

    return GestureDetector(
      child: Container(child: _buildFlipAnimation()),
      onTap: () {},
    );
  }
}
