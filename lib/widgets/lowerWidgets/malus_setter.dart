import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class MalusSetter extends StatefulWidget {
  // final String title;
  final String hint;
  final double titleFieldWidthPercent;
  final Function onChanged;
  final Color? fontColor;
  const MalusSetter(
      {super.key,
      this.titleFieldWidthPercent = 0.35,
      this.fontColor = Colors.white,
      // required this.title,
      required this.hint,
      required this.onChanged});

  @override
  State<MalusSetter> createState() => _MalusSetterState();
}

class _MalusSetterState extends State<MalusSetter> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = (MediaQuery.of(context).size.width).clamp(0, 1000);
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
            width: 90,
            height: 60,
            // color: Colors.white,
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
              // readOnly: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: widget.hint,
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
