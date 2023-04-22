import 'dart:math';

import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class DiceCaracteristic extends StatefulWidget {
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
      required this.buffer});

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
      child: FittedBox(
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
            DiceButton(width: width, stat: stat, buffer: buffer),
          ]),
        ),
      ),
    );
  }
}

class DiceButton extends StatefulWidget {
  final double width;
  final int stat;
  final int buffer;
  const DiceButton(
      {super.key,
      required this.width,
      required this.stat,
      required this.buffer});

  @override
  State<DiceButton> createState() => _DiceButtonState();
}

class _DiceButtonState extends State<DiceButton> {
  bool showResult = false;
  String result = "";
  int resultColor = 0;
  Color textColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: widget.width * 0.3,
        height: 30,
        color: showResult ? null : MyDecoration.bloodColor,
        child: Center(
          child: showResult
              ? Text(
                  result,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
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
      ),
      onTap: () {
        if (!showResult) {
          int random = Random().nextInt(101);
          result = "$random";
          if (random > (widget.stat + widget.buffer)) {
            textColor = Colors.green;
            result += " succès";
          } else {
            textColor = Colors.red;
            result += " échec";
          }
        }
        setState(() {
          showResult = !showResult;
        });
      },
    );
  }
}
