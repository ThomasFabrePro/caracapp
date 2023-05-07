import 'dart:async';

import 'package:caracapp/models/attribute_model.dart';
import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/widgets/lowerWidgets/character_picture.dart';
import 'package:caracapp/widgets/lowerWidgets/pick_image.dart';
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
  bool disableAttributeButton = false;

  @override
  void initState() {
    super.initState();
    if (widget.disableAttributeButton || widget.character.attribute == 0) {
      disableAttributeButton = true;
    }
  }

  void updatePhoto(String value) {
    setState(() {
      widget.character.picture = value;
      widget.character.setPicture(value);
      displayPhotosGrid = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              : disableAttributeButton
                  ? characterPicture
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        characterPicture,
                        AttributeButton(character: widget.character),
                      ],
                    ),
        ),
      ],
    );
  }
}

class AttributeButton extends StatefulWidget {
  final Character character;
  const AttributeButton({super.key, required this.character});

  @override
  State<AttributeButton> createState() => _AttributeButtonState();
}

class _AttributeButtonState extends State<AttributeButton> {
  int attributeEnabled = 0;
  Attribute attribute = Attribute();
  String buttonText = "";
  @override
  void initState() {
    super.initState();

    attribute = widget.character.getAttribute;
  }

  Stream<Character> getCharacterStats() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      if (attributeEnabled != widget.character.attributeEnabled) {
        attributeEnabled = widget.character.attributeEnabled;
        yield widget.character;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width).clamp(0, 1000);

    return StreamBuilder<Character>(
        stream: getCharacterStats(),
        builder: (context, snapshot) {
          attributeEnabled =
              snapshot.hasData ? snapshot.data!.attributeEnabled : 0;
          buttonText = fillButtonText();

          return GestureDetector(
            onTap: () async {
              if (attribute.code != 1) {
                setState(() {
                  attributeEnabled = attributeEnabled == 0 ? 1 : 0;
                });
                await widget.character.attributeBoost(attributeEnabled);
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10.0),
              child: Container(
                width: width * 0.4,
                height: 60,
                constraints: const BoxConstraints(
                  maxWidth: 300,
                ),
                decoration: BoxDecoration(
                  color: attribute.code != 1 || attributeEnabled == 1
                      ? MyDecoration.bloodColor
                      : Colors.grey[800],
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
                      offset: const Offset(2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    buttonText,
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
          );
        });
  }

  String fillButtonText() {
    attributeEnabled = widget.character.attributeEnabled;
    if (attribute.code == 1) {
      return attributeEnabled == 1
          ? "${attribute.name} Activé"
          : "${attribute.name} Désactivé";
    } else {
      return attributeEnabled == 1
          ? "Désactiver ${attribute.name}"
          : "Activer ${attribute.name}";
    }
  }
}
