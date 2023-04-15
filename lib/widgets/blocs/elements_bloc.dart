import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/models/kekkai_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ElementBloc extends StatefulWidget {
  final Character character;
  const ElementBloc({super.key, required this.character});

  @override
  State<ElementBloc> createState() => _ElementBlocState();
}

class _ElementBlocState extends State<ElementBloc> {
  bool isFireChecked = false;
  bool isThunderChecked = false;
  bool isWaterChecked = false;
  bool isWindChecked = false;
  bool isEarthChecked = false;
  double titleWidthPercent = 0.2;
  int maxCheckCounter = 2;
  int checkCounter = 0;
  int noElement = 0;
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

  void setChecks(int element) {
    switch (element) {
      case 1:
        isFireChecked = true;
        break;
      case 2:
        isThunderChecked = true;
        break;
      case 3:
        isWaterChecked = true;
        break;
      case 4:
        isWindChecked = true;
        break;
      case 5:
        isEarthChecked = true;
        break;
      default:
        break;
    }
  }

  @override
  void initState() {
    setChecks(widget.character.mainElement);
    if (widget.character.mainElement != 0) {
      checkCounter++;
    }
    setChecks(widget.character.secondElement);
    if (widget.character.secondElement != 0) {
      checkCounter++;
    }
    super.initState();
  }

  Future<bool> confirmCheck(
      {required int code, required bool value, required bool check}) async {
    if ((checkCounter < maxCheckCounter && value == true) ||
        (check == true && value == false)) {
      value == true ? checkCounter++ : checkCounter--;
      check = value;
      await widget.character.setElement(code, add: value);
      setState(() {});
      return check;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 20.0, top: 10),
          child: Text("Éléments",
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [MyDecoration.boxShadow],
            ),
            child: Column(
              children: [
                //!KEKKAI
                widget.character.kekkaiGenkai == 0
                    ? const SizedBox()
                    : KekkaiDescription(
                        kekkaiCode: widget.character.kekkaiGenkai,
                      ),
                //!FIRE
                Stack(
                  children: [
                    SizedBox(
                      width: width,
                      child: FittedBox(
                        child: Image.asset(
                          "assets/elements/fire.jpg",
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        //checkbox
                        Container(
                          height: 40,
                          color: const Color.fromARGB(172, 255, 255, 255),
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isFireChecked,
                            onChanged: (bool? value) async {
                              isFireChecked = await confirmCheck(
                                  code: 1, value: value!, check: isFireChecked);
                            },
                          ),
                        ),
                        //mainElement name
                        Container(
                          height: 40,
                          color: const Color.fromARGB(172, 255, 255, 255),
                          child: SizedBox(
                            // width: width * titleWidthPercent,
                            child: Center(
                              child: Text(
                                "Feu  ",
                                style: titleStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                //!THUNDER
                Stack(
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: SizedBox(
                        width: width,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.asset(
                            "assets/elements/thunder.jpg",
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        //checkbox
                        Container(
                          height: 40,
                          color: const Color.fromARGB(172, 255, 255, 255),
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isThunderChecked,
                            onChanged: (bool? value) async {
                              isThunderChecked = await confirmCheck(
                                  code: 2,
                                  value: value!,
                                  check: isThunderChecked);
                            },
                          ),
                        ),
                        //mainElement name
                        Container(
                          height: 40,
                          color: const Color.fromARGB(172, 255, 255, 255),
                          child: SizedBox(
                            child: Center(
                              child: Text(
                                "Foudre  ",
                                style: titleStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                //!WATER
                Stack(
                  children: [
                    SizedBox(
                      width: width,
                      child: FittedBox(
                        child: Image.asset(
                          "assets/elements/water.jpg",
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        //checkbox
                        Container(
                          height: 40,
                          color: const Color.fromARGB(172, 255, 255, 255),
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isWaterChecked,
                            onChanged: (bool? value) async {
                              isWaterChecked = await confirmCheck(
                                  code: 3,
                                  value: value!,
                                  check: isWaterChecked);
                            },
                          ),
                        ),
                        //mainElement name
                        Container(
                          height: 40,
                          color: const Color.fromARGB(172, 255, 255, 255),
                          child: SizedBox(
                            // width: width * titleWidthPercent,
                            child: Center(
                              child: Text(
                                "Eau  ",
                                style: titleStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                //!WIND
                Stack(
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: SizedBox(
                        width: width,
                        child: FittedBox(
                          child: Image.asset(
                            "assets/elements/wind.jpg",
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        //checkbox
                        Container(
                          height: 40,
                          color: const Color.fromARGB(172, 255, 255, 255),
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isWindChecked,
                            onChanged: (bool? value) async {
                              isWindChecked = await confirmCheck(
                                  code: 4, value: value!, check: isWindChecked);
                            },
                          ),
                        ),
                        //mainElement name
                        Container(
                          height: 40,
                          color: const Color.fromARGB(172, 255, 255, 255),
                          child: SizedBox(
                            // width: width * titleWidthPercent,
                            child: Center(
                              child: Text(
                                "Vent  ",
                                style: titleStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                //!EARTH
                Stack(
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: SizedBox(
                        width: width,
                        child: FittedBox(
                          child: Image.asset(
                            "assets/elements/earth.jpg",
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        //checkbox
                        Container(
                          height: 40,
                          color: const Color.fromARGB(172, 255, 255, 255),
                          child: Checkbox(
                            checkColor: Colors.white,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isEarthChecked,
                            onChanged: (bool? value) async {
                              isEarthChecked = await confirmCheck(
                                  code: 5,
                                  value: value!,
                                  check: isEarthChecked);
                            },
                          ),
                        ),
                        //mainElement name
                        Container(
                          height: 40,
                          color: const Color.fromARGB(172, 255, 255, 255),
                          child: SizedBox(
                            // width: width * titleWidthPercent,
                            child: Center(
                              child: Text(
                                "Terre  ",
                                style: titleStyle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class KekkaiDescription extends StatelessWidget {
  final int kekkaiCode;
  const KekkaiDescription({super.key, required this.kekkaiCode});

  @override
  Widget build(BuildContext context) {
    Kekkai kekkai = Kekkai().getElement(kekkaiCode);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Image.asset(kekkai.image),
        ),
        Text(
          "Kekkai possible : ${kekkai.name}",
          style: MyDecoration.titleStyle,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 24.0, bottom: 32.0),
          child: Text(
            textAlign: TextAlign.center,
            kekkai.description,
            style: MyDecoration.dataStyle,
          ),
        ),
      ],
    );
  }
}
