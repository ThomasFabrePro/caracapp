import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class UpgradeCaracteristic extends StatefulWidget {
  final String title;
  final int stat;
  final int buffer;
  final int? minValue;
  final int? onMaxValue;
  // final int? maxValue;
  final Color? fontColor;
  final Function? onTap;
  final bool isEditable;
  final bool cantAddMoreThan;
  const UpgradeCaracteristic(
      {super.key,
      this.fontColor,
      this.minValue,
      this.onMaxValue,
      // this.maxValue,
      required this.isEditable,
      required this.cantAddMoreThan,
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
  String onMaxValue = "";
  String bufferText = "";
  late bool isEditable;
  bool cantAddMoreThan = false;
  @override
  void initState() {
    super.initState();
    isEditable = widget.isEditable;

    if (widget.minValue == null) {
      minValue = widget.stat;
    }
    onMaxValue = widget.onMaxValue != null ? "/${widget.onMaxValue}" : "";
  }

  @override
  Widget build(BuildContext context) {
    stat = widget.stat;
    cantAddMoreThan = widget.cantAddMoreThan;
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
      child: FittedBox(
        child: SizedBox(
          height: 35,
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
              width: width * 0.2,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${(stat + buffer).toString()}$onMaxValue',
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
                        text: onMaxValue != "" ? "" : " $bufferText",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: width * 0.1,
              child: isEditable && stat > minValue
                  ? GestureDetector(
                      child: Icon(
                        Icons.remove,
                        size: 35,
                        color: Colors.red[900],
                      ),
                      onTap: () async {
                        setState(() {
                          stat = (stat - 1).clamp(30, 100);
                        });
                        await widget.onTap!(-1);
                      },
                    )
                  : const SizedBox(),
            ),
            SizedBox(
              width: isEditable ? 20 : null,
            ),
            isEditable && !cantAddMoreThan
                ? SizedBox(
                    width: width * 0.1,
                    child: GestureDetector(
                        onTap: () async {
                          setState(() {
                            stat = (stat + 1).clamp(30, 100);
                          });
                          await widget.onTap!(1);
                        },
                        child: const Icon(
                          Icons.add,
                          size: 35,
                          // Icons.exposure_plus_1_outlined,
                          color: Colors.green,
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
