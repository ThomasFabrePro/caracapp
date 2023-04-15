import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String title;
  final String hint;
  final double titleFieldWidthPercent;
  final double textFieldWidthPercent;
  final Function onChanged;
  final Color? fontColor;
  const MyTextField(
      {super.key,
      this.titleFieldWidthPercent = 0.22,
      this.textFieldWidthPercent = 0.42,
      this.fontColor = Colors.white,
      required this.title,
      required this.hint,
      required this.onChanged});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = (MediaQuery.of(context).size.width).clamp(0, 1000);
    return Row(
      children: [
        SizedBox(
            width: width * widget.titleFieldWidthPercent,
            child: Text(widget.title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: widget.fontColor,
                  overflow: TextOverflow.ellipsis,
                ))),
        SizedBox(
          width: width * widget.textFieldWidthPercent,
          height: 40,
          child: Container(
            // color: Colors.white,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                MyDecoration.textFieldBoxShadow,
              ],
            ),
            child: TextField(
              style: const TextStyle(
                fontSize: 18,
              ),
              // readOnly: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                hintText: widget.hint,
              ),
              onChanged: (value) {
                widget.onChanged(value);
              },
            ),
          ),
        ),
      ],
    );
  }
}
