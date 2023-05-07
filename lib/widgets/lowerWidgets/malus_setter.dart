import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class MalusSetter extends StatefulWidget {
  final double titleFieldWidthPercent;
  final Function onChanged;
  final Color? fontColor;
  const MalusSetter(
      {super.key,
      this.titleFieldWidthPercent = 0.35,
      this.fontColor = Colors.white,
      required this.onChanged});

  @override
  State<MalusSetter> createState() => _MalusSetterState();
}

class _MalusSetterState extends State<MalusSetter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          Text("Malus de dé :",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: widget.fontColor,
                overflow: TextOverflow.ellipsis,
              )),
          const SizedBox(width: 16),
          Container(
            width: 80,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                MyDecoration.textFieldBoxShadow,
              ],
            ),
            child: TextFormField(
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 25,
              ),
              decoration: const InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: "0",
              ),
              onChanged: (value) {
                try {
                  int.parse(value);
                } catch (e) {
                  value = "100";
                }
                widget.onChanged(int.parse(value));
              },
            ),
          ),
        ],
      ),
    );
  }
}
