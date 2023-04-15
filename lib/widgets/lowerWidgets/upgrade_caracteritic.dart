import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class UpgradeCaracteristic extends StatefulWidget {
  final String title;
  final int stat;
  final int buffer;
  final Color? fontColor;
  final Function? onTap;
  const UpgradeCaracteristic(
      {super.key,
      this.fontColor,
      required this.title,
      required this.onTap,
      required this.stat,
      required this.buffer});

  @override
  State<UpgradeCaracteristic> createState() => _UpgradeCaracteristicState();
}

class _UpgradeCaracteristicState extends State<UpgradeCaracteristic> {
  int stat = 0;
  int buffer = 0;
  String bufferText = "";

  @override
  Widget build(BuildContext context) {
    stat = widget.stat;
    buffer = widget.buffer;
    if (buffer > 0) {
      bufferText = "(+$buffer)";
    } else {
      bufferText = "($buffer)";
    }
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: FittedBox(
        child: Row(children: [
          SizedBox(
            width: width * 0.38,
            child: Text(widget.title,
                style: TextStyle(
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
          SizedBox(
            width: width * 0.1,
            child: GestureDetector(
              child: Image.asset(
                MyImages().imagePath[image.buttonMinus]!,
                color: Colors.red[900],
              ),
              onTap: () {
                setState(() {
                  stat = (stat - 1).clamp(30, 100);
                  widget.onTap!(-1);
                });
              },
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: width * 0.1,
            child: GestureDetector(
                onTap: () {
                  setState(() {
                    stat = (stat + 1).clamp(30, 100);
                    widget.onTap!(1);
                  });
                },
                child: Image.asset(
                  MyImages().imagePath[image.buttonPlus]!,
                  color: Colors.green[800],
                )

                // child: MaterialIcons.plus,
                ),
          ),
        ]),
      ),
    );
  }
}
