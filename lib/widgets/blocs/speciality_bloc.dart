import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class SpecialityBloc extends StatefulWidget {
  final Character character;
  const SpecialityBloc({super.key, required this.character});

  @override
  State<SpecialityBloc> createState() => _SpecialityBlocState();
}

class _SpecialityBlocState extends State<SpecialityBloc> {
  bool isTaijutsuChecked = false;
  bool isNinjutsuChecked = false;
  bool isGenjustsuChecked = false;
  bool isThrowingChecked = false;
  bool isChakraChecked = false;
  bool isLuckChecked = false;
  bool isDodgeChecked = false;
  double titleWidthPercent = 0.33;
  int maxCheckCounter = 2;
  int checkCounter = 0;
  int noSpeciality = 0;
  TextStyle titleStyle = TextStyle(
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

  Map<String, String> descriptions = {
    "Taijutsu": "+5",
    "Ninjutsu": "+5",
    "Genjutsu": "+5",
    "Throwing": "+5",
    "Chakra": "+5",
    "Luck": "+5",
    "Dodge": "+5",
  };

  void setChecks(int speciality) {
    switch (speciality) {
      case 1:
        isTaijutsuChecked = true;
        // isGenjustsuChecked = false;
        // isNinjutsuChecked = false;
        // isThrowingChecked = false;
        // isChakraChecked = false;
        // isLuckChecked = false;
        // isDodgeChecked = false;
        break;
      case 2:
        // isTaijutsuChecked = false;
        isNinjutsuChecked = true;
        // isGenjustsuChecked = false;
        // isThrowingChecked = false;
        // isChakraChecked = false;
        // isLuckChecked = false;
        // isDodgeChecked = false;
        break;
      case 3:
        // isTaijutsuChecked = false;
        // isNinjutsuChecked = false;
        isGenjustsuChecked = true;
        // isThrowingChecked = false;
        // isChakraChecked = false;
        // isLuckChecked = false;
        // isDodgeChecked = false;
        break;
      case 4:
        // isTaijutsuChecked = false;
        // isNinjutsuChecked = false;
        // isGenjustsuChecked = false;
        isThrowingChecked = true;
        // isChakraChecked = false;
        // isLuckChecked = false;
        // isDodgeChecked = false;
        break;
      case 5:
        // isTaijutsuChecked = false;
        // isNinjutsuChecked = false;
        // isGenjustsuChecked = false;
        // isThrowingChecked = false;
        isChakraChecked = true;
        // isLuckChecked = false;
        // isDodgeChecked = false;
        break;
      case 6:
        // isTaijutsuChecked = false;
        // isNinjutsuChecked = false;
        // isGenjustsuChecked = false;
        // isThrowingChecked = false;
        // isChakraChecked = false;
        isLuckChecked = true;
        // isDodgeChecked = false;
        break;
      case 7:
        // isTaijutsuChecked = false;
        // isNinjutsuChecked = false;
        // isGenjustsuChecked = false;
        // isThrowingChecked = false;
        // isChakraChecked = false;
        // isLuckChecked = false;
        isDodgeChecked = true;
        break;
      default:
        // isTaijutsuChecked = false;
        // isNinjutsuChecked = false;
        // isGenjustsuChecked = false;
        // isThrowingChecked = false;
        // isChakraChecked = false;
        // isLuckChecked = false;
        // isDodgeChecked = false;
        break;
    }
  }

  @override
  void initState() {
    setChecks(widget.character.speciality);
    if (widget.character.speciality != 0) {
      checkCounter++;
    }
    setChecks(widget.character.secondSpeciality);
    if (widget.character.secondSpeciality != 0) {
      checkCounter++;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      // height: 200,
      // color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [MyDecoration.boxShadow],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                //checkbox
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isTaijutsuChecked,
                  onChanged: (bool? value) async {
                    print("TEST PUSHED");

                    int specialityCode = 1;

                    if (checkCounter < maxCheckCounter && value == true) {
                      if (widget.character.speciality == noSpeciality) {
                        await widget.character.setSpeciality(specialityCode);
                        widget.character.speciality = specialityCode;
                      } else if (widget.character.secondSpeciality ==
                          noSpeciality) {
                        await widget.character
                            .setSecondSpeciality(specialityCode);
                        widget.character.secondSpeciality = specialityCode;
                      }

                      setState(() {
                        isTaijutsuChecked = true;
                        checkCounter++;
                      });
                    } else if (isTaijutsuChecked == true && value == false) {
                      if (widget.character.speciality == specialityCode) {
                        await widget.character.setSpeciality(noSpeciality);
                        widget.character.speciality = noSpeciality;
                      } else if (widget.character.secondSpeciality ==
                          specialityCode) {
                        await widget.character
                            .setSecondSpeciality(noSpeciality);
                        widget.character.secondSpeciality = noSpeciality;
                      }
                      setState(() {
                        isTaijutsuChecked = false;
                        checkCounter--;
                      });
                    }
                  },
                ),
                //speciality name
                SizedBox(
                  width: width * titleWidthPercent,
                  child: Text(
                    "Taïjutsu",
                    style: titleStyle,
                  ),
                ),
                Text(
                  descriptions["Taijutsu"]!,
                  style: MyDecoration.dataStyle,
                ),
              ],
            ),
            Row(
              children: [
                //checkbox
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isNinjutsuChecked,
                  onChanged: (bool? value) async {
                    print("TEST PUSHED");

                    int specialityCode = 2;
                    if (checkCounter < maxCheckCounter && value == true) {
                      print("TEST dans premier if confirmCheck");
                      if (widget.character.speciality == noSpeciality) {
                        await widget.character.setSpeciality(specialityCode);
                        widget.character.speciality = specialityCode;
                      } else if (widget.character.secondSpeciality ==
                          noSpeciality) {
                        await widget.character
                            .setSecondSpeciality(specialityCode);
                        widget.character.secondSpeciality = specialityCode;
                      }

                      setState(() {
                        isNinjutsuChecked = true;
                        checkCounter++;
                      });
                    } else if (isNinjutsuChecked == true && value == false) {
                      print("TEST dans else if confirmCheck");

                      if (widget.character.speciality == specialityCode) {
                        await widget.character.setSpeciality(noSpeciality);
                        widget.character.speciality = noSpeciality;
                      } else if (widget.character.secondSpeciality ==
                          specialityCode) {
                        await widget.character
                            .setSecondSpeciality(noSpeciality);
                        widget.character.secondSpeciality = noSpeciality;
                      }
                      setState(() {
                        isNinjutsuChecked = false;
                        checkCounter--;
                      });
                    }
                  },
                ),
                //speciality name
                SizedBox(
                  width: width * titleWidthPercent,
                  child: Text(
                    "Ninjutsu",
                    style: titleStyle,
                  ),
                ),
                Text(
                  descriptions["Ninjutsu"]!,
                  style: MyDecoration.dataStyle,
                ),
              ],
            ),
            Row(
              children: [
                //checkbox
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isGenjustsuChecked,
                  onChanged: (bool? value) async {
                    print("TEST PUSHED");

                    int specialityCode = 3;
                    if (checkCounter < maxCheckCounter && value == true) {
                      print("TEST dans premier if confirmCheck");
                      if (widget.character.speciality == noSpeciality) {
                        await widget.character.setSpeciality(specialityCode);
                        widget.character.speciality = specialityCode;
                      } else if (widget.character.secondSpeciality ==
                          noSpeciality) {
                        await widget.character
                            .setSecondSpeciality(specialityCode);
                        widget.character.secondSpeciality = specialityCode;
                      }

                      setState(() {
                        isGenjustsuChecked = true;
                        checkCounter++;
                      });
                    } else if (isGenjustsuChecked == true && value == false) {
                      print("TEST dans else if confirmCheck");

                      if (widget.character.speciality == specialityCode) {
                        await widget.character.setSpeciality(noSpeciality);
                        widget.character.speciality = noSpeciality;
                      } else if (widget.character.secondSpeciality ==
                          specialityCode) {
                        await widget.character
                            .setSecondSpeciality(noSpeciality);
                        widget.character.secondSpeciality = noSpeciality;
                      }
                      setState(() {
                        isGenjustsuChecked = false;
                        checkCounter--;
                      });
                    }
                  },
                ),
                //speciality name
                SizedBox(
                  width: width * titleWidthPercent,
                  child: Text(
                    "Genjutsu",
                    style: titleStyle,
                  ),
                ),
                Text(
                  descriptions["Genjutsu"]!,
                  style: MyDecoration.dataStyle,
                ),
              ],
            ),
            Row(
              children: [
                //checkbox
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isThrowingChecked,
                  onChanged: (bool? value) async {
                    print("TEST PUSHED");
                    int specialityCode = 4;
                    if (checkCounter < maxCheckCounter && value == true) {
                      print("TEST dans premier if confirmCheck");
                      if (widget.character.speciality == noSpeciality) {
                        await widget.character.setSpeciality(specialityCode);
                        widget.character.speciality = specialityCode;
                      } else if (widget.character.secondSpeciality ==
                          noSpeciality) {
                        await widget.character
                            .setSecondSpeciality(specialityCode);
                        widget.character.secondSpeciality = specialityCode;
                      }

                      setState(() {
                        isThrowingChecked = true;
                        checkCounter++;
                      });
                    } else if (isThrowingChecked == true && value == false) {
                      print("TEST dans else if confirmCheck");

                      if (widget.character.speciality == specialityCode) {
                        await widget.character.setSpeciality(noSpeciality);
                        widget.character.speciality = noSpeciality;
                      } else if (widget.character.secondSpeciality ==
                          specialityCode) {
                        await widget.character
                            .setSecondSpeciality(noSpeciality);
                        widget.character.secondSpeciality = noSpeciality;
                      }
                      setState(() {
                        isThrowingChecked = false;
                        checkCounter--;
                      });
                    }
                  },
                ),
                //speciality name
                SizedBox(
                  width: width * titleWidthPercent,
                  child: Text(
                    "Lancer",
                    style: titleStyle,
                  ),
                ),
                Text(
                  descriptions["Throwing"]!,
                  style: MyDecoration.dataStyle,
                ),
              ],
            ),
            Row(
              children: [
                //checkbox
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChakraChecked,
                  onChanged: (bool? value) async {
                    print("TEST PUSHED");
                    int specialityCode = 5;
                    if (checkCounter < maxCheckCounter && value == true) {
                      print("TEST dans premier if confirmCheck");
                      if (widget.character.speciality == noSpeciality) {
                        await widget.character.setSpeciality(specialityCode);
                        widget.character.speciality = specialityCode;
                      } else if (widget.character.secondSpeciality ==
                          noSpeciality) {
                        await widget.character
                            .setSecondSpeciality(specialityCode);
                        widget.character.secondSpeciality = specialityCode;
                      }

                      setState(() {
                        isChakraChecked = true;
                        checkCounter++;
                      });
                    } else if (isChakraChecked == true && value == false) {
                      print("TEST dans else if confirmCheck");

                      if (widget.character.speciality == specialityCode) {
                        await widget.character.setSpeciality(noSpeciality);
                        widget.character.speciality = noSpeciality;
                      } else if (widget.character.secondSpeciality ==
                          specialityCode) {
                        await widget.character
                            .setSecondSpeciality(noSpeciality);
                        widget.character.secondSpeciality = noSpeciality;
                      }
                      setState(() {
                        isChakraChecked = false;
                        checkCounter--;
                      });
                    }
                  },
                ),
                //speciality name
                SizedBox(
                  width: width * titleWidthPercent,
                  child: Text(
                    "Chakra",
                    style: titleStyle,
                  ),
                ),
                Text(
                  descriptions["Chakra"]!,
                  style: MyDecoration.dataStyle,
                ),
              ],
            ),
            Row(
              children: [
                //checkbox
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isLuckChecked,
                  onChanged: (bool? value) async {
                    print("TEST PUSHED");
                    int specialityCode = 6;
                    if (checkCounter < maxCheckCounter && value == true) {
                      print("TEST dans premier if confirmCheck");
                      if (widget.character.speciality == noSpeciality) {
                        await widget.character.setSpeciality(specialityCode);
                        widget.character.speciality = specialityCode;
                      } else if (widget.character.secondSpeciality ==
                          noSpeciality) {
                        await widget.character
                            .setSecondSpeciality(specialityCode);
                        widget.character.secondSpeciality = specialityCode;
                      }

                      setState(() {
                        isLuckChecked = true;
                        checkCounter++;
                      });
                    } else if (isLuckChecked == true && value == false) {
                      print("TEST dans else if confirmCheck");

                      if (widget.character.speciality == specialityCode) {
                        await widget.character.setSpeciality(noSpeciality);
                        widget.character.speciality = noSpeciality;
                      } else if (widget.character.secondSpeciality ==
                          specialityCode) {
                        await widget.character
                            .setSecondSpeciality(noSpeciality);
                        widget.character.secondSpeciality = noSpeciality;
                      }
                      setState(() {
                        isLuckChecked = false;
                        checkCounter--;
                      });
                    }
                  },
                ),
                //speciality name
                SizedBox(
                  width: width * titleWidthPercent,
                  child: Text(
                    "Chance",
                    style: titleStyle,
                  ),
                ),
                Text(
                  descriptions["Luck"]!,
                  style: MyDecoration.dataStyle,
                ),
              ],
            ),
            Row(
              children: [
                //checkbox
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isDodgeChecked,
                  onChanged: (bool? value) async {
                    print("TEST PUSHED");
                    int specialityCode = 7;
                    if (checkCounter < maxCheckCounter && value == true) {
                      print("TEST dans premier if confirmCheck");
                      if (widget.character.speciality == noSpeciality) {
                        await widget.character.setSpeciality(specialityCode);
                        widget.character.speciality = specialityCode;
                      } else if (widget.character.secondSpeciality ==
                          noSpeciality) {
                        await widget.character
                            .setSecondSpeciality(specialityCode);
                        widget.character.secondSpeciality = specialityCode;
                      }

                      setState(() {
                        isDodgeChecked = true;
                        checkCounter++;
                      });
                    } else if (isDodgeChecked == true && value == false) {
                      print("TEST dans else if confirmCheck");

                      if (widget.character.speciality == specialityCode) {
                        await widget.character.setSpeciality(noSpeciality);
                        widget.character.speciality = noSpeciality;
                      } else if (widget.character.secondSpeciality ==
                          specialityCode) {
                        await widget.character
                            .setSecondSpeciality(noSpeciality);
                        widget.character.secondSpeciality = noSpeciality;
                      }
                      setState(() {
                        isDodgeChecked = false;
                        checkCounter--;
                      });
                    }
                  },
                ),
                //speciality name
                SizedBox(
                  width: width * titleWidthPercent,
                  child: Text(
                    "Esquive /  Blocage",
                    style: titleStyle,
                  ),
                ),
                Text(
                  descriptions["Dodge"]!,
                  style: MyDecoration.dataStyle,
                ),
              ],
            ),
            // SpecialityDescription(speciality: widget.character.speciality),
          ],
        ),
      ),
    );
  }
}

// class SpecialityDescription extends StatelessWidget {
//   final int speciality;
//   const SpecialityDescription({super.key, required this.speciality});

//   @override
//   Widget build(BuildContext context) {
//     // String imagePath = "";
//     String description = "";
//     switch (speciality) {
//       case 1:
//         description = "Taïjutsu +10";
//         break;
//       case 2:
//         description = "Ninjutsu +10";
//         break;
//       case 3:
//         description = "Genjutsu +10";
//         break;
//       case 4:
//         description = "Lancer +10";
//         break;
//       case 5:
//         description = "Chakra +10";
//         break;
//       case 6:
//         description = "Invocation +10";
//         break;
//       case 7:
//         description = "Sceaux +10";
//         break;
//       default:
//         // imagePath = "";
//         description = "rien";
//         break;
//     }
//     return speciality > 0
//         ? Column(
//             children: [
//               // SizedBox(height: 170, child: Image.asset(imagePath)),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   description,
//                   //DATASTYLE
//                   style: MyDecoration.dataStyle,
//                 ),
//               )
//             ],
//           )
//         : const SizedBox();
//   }
// }
