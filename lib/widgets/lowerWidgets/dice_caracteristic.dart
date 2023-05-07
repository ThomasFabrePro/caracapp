import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/widgets/lowerWidgets/dice_button.dart';
import 'package:flutter/material.dart';

class DiceCaracteristic extends StatefulWidget {
  final Character character;
  final String title;
  final int malus;
  final int stat;
  final int buffer;
  final Color? fontColor;
  final Function? onTap;
  const DiceCaracteristic(
      {super.key,
      this.fontColor,
      this.malus = 0,
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
  Widget build(BuildContext context) {
    stat = widget.stat;
    buffer = widget.buffer;
    if (buffer > 0) {
      bufferText = "(+$buffer)";
    } else if (buffer == 0) {
      bufferText = "";
    } else {
      bufferText = "($buffer)";
    }
    double width = (MediaQuery.of(context).size.width).clamp(0, 1000);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: SizedBox(
        height: 40,
        child: Row(children: [
          SizedBox(
            width: width * 0.38,
            child: Text(widget.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyDecoration.bloodColor,
                  overflow: TextOverflow.ellipsis,
                )),
          ),
          SizedBox(
            width: width * 0.2,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${(stat + buffer).toString()}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: buffer > 0
                          ? Colors.green
                          : buffer < 0
                              ? Colors.red
                              : Colors.black,
                    ),
                  ),
                  TextSpan(
                      text: " $bufferText",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: DiceButton(
              character: widget.character,
              title: widget.title,
              stat: stat,
              buffer: buffer,
              malus: widget.malus,
            ),
          ),
        ]),
      ),
    );
  }
}
