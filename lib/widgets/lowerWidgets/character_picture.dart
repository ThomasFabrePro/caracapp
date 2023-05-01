import 'package:flutter/material.dart';

class CharacterPicture extends StatefulWidget {
  final Function? onTap;
  final String pathPicture;
  const CharacterPicture({super.key, this.onTap, required this.pathPicture});

  @override
  State<CharacterPicture> createState() => _CharacterPictureState();
}

class _CharacterPictureState extends State<CharacterPicture> {
  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width).clamp(0, 1000);
    return GestureDetector(
      onTap: () => widget.onTap!(),
      child: Container(
        width: width * 0.4,
        height: width * 0.4,
        constraints: const BoxConstraints(maxHeight: 300, maxWidth: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(widget.pathPicture),
          ),
        ),
      ),
    );
  }
}
