import 'package:flutter/widgets.dart';

class PickImage extends StatefulWidget {
  final String imagePath;
  final Function onTap;

  const PickImage({super.key, required this.imagePath, required this.onTap});

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(widget.imagePath);
      },
      child: SizedBox(
          width: 100,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              child: Image(
                image: AssetImage(widget.imagePath),
              ),
            ),
          )),
    );
  }
}
