import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class PhotoBloc extends StatefulWidget {
  final Character character;
  final bool disableAttributeButton;
  const PhotoBloc(this.character,
      {super.key, this.disableAttributeButton = false});

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
    CharacterPicture characterPicture = CharacterPicture(
      pathPicture: widget.character.picture,
      onTap: () => setState(() {
        displayPhotosGrid = true;
      }),
    );
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 1000,
          ),
          child: displayPhotosGrid
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
              : widget.disableAttributeButton
                  ? characterPicture
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        characterPicture,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Attribut :",
                              style: TextStyle(color: Colors.white),
                            ),
                            GestureDetector(
                              onTap: () async {
                                // setState(() {
                                //   widget.character
                                //     ..level += 1
                                //     ..pointsLeftToSpend += 5;
                                // });
                                // await widget.character.setLevel(widget.character.level);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, left: 10.0),
                                child: Container(
                                  width: width * 0.4,
                                  height: 60,
                                  constraints: const BoxConstraints(
                                    maxWidth: 300,
                                  ),
                                  decoration: BoxDecoration(
                                    color: MyDecoration.bloodColor,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.3),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: const Offset(
                                            2, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Niveau ${widget.character.level}",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
        ),
      ],
    );
  }
}

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
