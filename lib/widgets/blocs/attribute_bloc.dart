import 'package:caracapp/classes/genjutsus.dart';
import 'package:caracapp/models/attribute_model.dart';
import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class AttributeBloc extends StatefulWidget {
  final Character character;
  final ScrollController? scrollController;

  const AttributeBloc(
      {super.key, required this.character, this.scrollController});

  @override
  State<AttributeBloc> createState() => _AttributeBlocState();
}

class _AttributeBlocState extends State<AttributeBloc> {
  bool isJinchurikiChecked = false;
  bool isSharinganChecked = false;
  bool isByakuganChecked = false;
  TextStyle titleStyle = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: MyDecoration.bloodColor,
  );
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.red;
    }
    return MyDecoration.bloodColor;
  }

  void setChecks() {
    switch (widget.character.attribute) {
      case 1:
        isJinchurikiChecked = true;
        isByakuganChecked = false;
        isSharinganChecked = false;
        break;
      case 2:
        isSharinganChecked = true;
        isByakuganChecked = false;
        isJinchurikiChecked = false;
        break;
      case 3:
        isByakuganChecked = true;
        isSharinganChecked = false;
        isJinchurikiChecked = false;
        break;
      default:
        isByakuganChecked = false;
        isSharinganChecked = false;
        isJinchurikiChecked = false;
        break;
    }
  }

  @override
  void initState() {
    setChecks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Attribute attribute = widget.character.getAttribute;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 20.0, top: 10),
          child: Text("Attribut",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
          child: Container(
            width: width,
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [MyDecoration.boxShadow],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  AttributeDescription(attribute: attribute),
                  Row(
                    children: [
                      //checkbox
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isJinchurikiChecked,
                        onChanged: (bool? value) async {
                          int attribute = value == false ? 0 : 1;
                          await widget.character.setAttribute(attribute);
                          setState(() {
                            widget.character.attribute = attribute;
                            if (widget.scrollController != null &&
                                attribute != 0) {
                              widget.scrollController!.animateTo(height * 1.1,
                                  curve: Curves.linear,
                                  duration: const Duration(milliseconds: 500));
                            }

                            setChecks();
                          });
                        },
                      ),
                      //attribute name
                      Text(
                        "Jinchuriki",
                        style: titleStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      //checkbox
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isSharinganChecked,
                        onChanged: (bool? value) async {
                          int attribute = value == false ? 0 : 2;
                          await widget.character.setAttribute(attribute);
                          setState(() {
                            widget.character.attribute = attribute;
                            if (widget.scrollController != null &&
                                attribute != 0) {
                              widget.scrollController!.animateTo(height * 1.1,
                                  curve: Curves.linear,
                                  duration: const Duration(milliseconds: 500));
                            }
                            setChecks();
                          });
                        },
                      ),
                      //attribute name
                      Text(
                        "Sharingan",
                        style: titleStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      //checkbox
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isByakuganChecked,
                        onChanged: (bool? value) async {
                          int attribute = value == false ? 0 : 3;
                          await widget.character.setAttribute(attribute);
                          setState(() {
                            widget.character.attribute = attribute;
                            if (widget.scrollController != null &&
                                attribute != 0) {
                              widget.scrollController!.animateTo(height * 1.1,
                                  curve: Curves.linear,
                                  duration: const Duration(milliseconds: 500));
                            }
                            setChecks();
                          });
                        },
                      ),
                      //attribute name
                      Text(
                        "Byakugan",
                        style: titleStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AttributeDescription extends StatelessWidget {
  final Attribute attribute;
  const AttributeDescription({super.key, required this.attribute});

  @override
  Widget build(BuildContext context) {
    // Attribute attribute = Attribute().getAttribute(attributeCode);
    String imagePath = attribute.image;
    String description = attribute.description;

    return attribute.code > 0
        ? Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(height: 170, child: Image.asset(imagePath))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  description,
                  //DATASTYLE
                  style: MyDecoration.dataStyle,
                ),
              )
            ],
          )
        : const SizedBox();
  }
}
