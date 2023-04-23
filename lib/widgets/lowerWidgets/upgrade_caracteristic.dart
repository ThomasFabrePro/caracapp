import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class UpgradeCaracteristic extends StatefulWidget {
  final String title;
  final int stat;
  final int buffer;
  final int? minValue;
  // final int? maxValue;
  final Color? fontColor;
  final Function? onTap;
  final bool isEditable;
  final bool isMax;
  const UpgradeCaracteristic(
      {super.key,
      this.fontColor,
      this.minValue,
      // this.maxValue,
      required this.isEditable,
      required this.isMax,
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
  int minValue = 0;
  // int maxValue = 0;
  String bufferText = "";
  late bool isEditable;
  bool isMax = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isEditable = widget.isEditable;

    if (widget.minValue == null) {
      minValue = widget.stat;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("TEST build upgrade caracteristic");
    stat = widget.stat;
    isMax = widget.isMax;
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
          height: 35,
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
            SizedBox(
              width: width * 0.1,
              child: isEditable && stat > minValue
                  ? GestureDetector(
                      child: Image.asset(
                        "assets/front/minus_button.jpg",
                        color: Colors.red[900],
                      ),
                      onTap: () {
                        setState(() {
                          stat = (stat - 1).clamp(30, 100);
                          widget.onTap!(-1);
                        });
                      },
                    )
                  : const SizedBox(),
            ),
            SizedBox(
              width: isEditable ? 20 : null,
            ),
            isEditable && !isMax
                ? SizedBox(
                    width: width * 0.1,
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            stat = (stat + 1).clamp(30, 100);
                            widget.onTap!(1);
                          });
                        },
                        child: Image.asset(
                          "assets/front/plus_button.jpg",
                          color: Colors.green[800],
                        )

                        // child: MaterialIcons.plus,
                        ),
                  )
                : const SizedBox(),
          ]),
        ),
      ),
    );
  }
}
