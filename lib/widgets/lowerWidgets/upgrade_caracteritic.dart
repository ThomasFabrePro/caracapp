import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class UpgradeCaracteristic extends StatefulWidget {
  final String title;
  final int stat;
  final Color? fontColor;
  final Function? onTap;
  const UpgradeCaracteristic(
      {super.key,
      this.fontColor,
      required this.title,
      required this.onTap,
      required this.stat});

  @override
  State<UpgradeCaracteristic> createState() => _UpgradeCaracteristicState();
}

class _UpgradeCaracteristicState extends State<UpgradeCaracteristic> {
  int stat = 0;
  @override
  void initState() {
    stat = widget.stat;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(children: [
        SizedBox(
          width: width * 0.38,
          child: Text(widget.title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: widget.fontColor,
              )),
        ),
        SizedBox(
          width: width * 0.18,
          child: Text(stat.toString(),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: widget.fontColor,
              )),
        ),
        SizedBox(
          width: width * 0.1,
          child: GestureDetector(
            child: Image.asset(MyImages().imagePath[image.buttonMinus]!),
            onTap: () {
              setState(() {
                stat--;
                widget.onTap!(-1);
              });
            },
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        SizedBox(
          width: width * 0.1,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  stat++;
                  widget.onTap!(1);
                });
              },
              child: Image.asset(MyImages().imagePath[image.buttonPlus]!)

              // child: MaterialIcons.plus,
              ),
        ),
      ]),
    );
  }
}
