import 'package:caracapp/models/character_model.dart';
import 'package:flutter/material.dart';

class PhotoBloc extends StatefulWidget {
  final Character character;
  const PhotoBloc(this.character, {super.key});

  @override
  State<PhotoBloc> createState() => _PhotoBlocState();
}

class _PhotoBlocState extends State<PhotoBloc> {
  bool displayPhotosGrid = false;

  void updatePhoto(String value) {
    setState(() {
      widget.character.picture = value;
      widget.character.setPicture(value);
      displayPhotosGrid = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = (MediaQuery.of(context).size.width).clamp(0, 1000);
    return Column(
      children: [
        displayPhotosGrid
            ? const SizedBox()
            : Center(
                child: GestureDetector(
                onTap: () => setState(() {
                  displayPhotosGrid = true;
                }),
                child: Container(
                  width: width * 0.4,
                  height: width * 0.4,
                  constraints:
                      const BoxConstraints(maxHeight: 300, maxWidth: 300),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(widget.character.picture),
                    ),
                  ),
                ),
              )),
        displayPhotosGrid
            ? Container(
                constraints: const BoxConstraints(
                  maxWidth: 1000,
                ),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  children: [
                    PickImage(
                        imagePath: "assets/ninja_images/ninja_1.jpg",
                        onTap: (String value) {
                          updatePhoto(value);
                        }),
                    PickImage(
                        imagePath: "assets/ninja_images/ninja_2.jpg",
                        onTap: (String value) {
                          updatePhoto(value);
                        }),
                    PickImage(
                        imagePath: "assets/ninja_images/ninja_3.jpg",
                        onTap: (String value) {
                          updatePhoto(value);
                        }),
                    PickImage(
                        imagePath: "assets/ninja_images/ninja_4.jpg",
                        onTap: (String value) {
                          updatePhoto(value);
                        }),
                    PickImage(
                        imagePath: "assets/ninja_images/ninja_5.jpg",
                        onTap: (String value) {
                          updatePhoto(value);
                        }),
                    PickImage(
                        imagePath: "assets/ninja_images/ninja_6.jpg",
                        onTap: (String value) {
                          updatePhoto(value);
                        }),
                    PickImage(
                        imagePath: "assets/ninja_images/ninja_7.jpg",
                        onTap: (String value) {
                          updatePhoto(value);
                        }),
                    PickImage(
                        imagePath: "assets/ninja_images/ninja_8.jpg",
                        onTap: (String value) {
                          updatePhoto(value);
                        }),
                    PickImage(
                        imagePath: "assets/ninja_images/ninja_9.jpg",
                        onTap: (String value) {
                          updatePhoto(value);
                        }),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

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
