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

  Map<String, String> descriptions = {
    "Taijutsu": "+5",
    "Ninjutsu": "+5",
    "Genjutsu": "+5",
    "Throwing": "+5",
    "Chakra": "+5",
    "Luck": "+5",
    "Dodge": "+5",
  };

  void setChecks(int spe) {
    switch (spe) {
      case 1:
        isTaijutsuChecked = true;
        break;
      case 2:
        isNinjutsuChecked = true;
        break;
      case 3:
        isGenjustsuChecked = true;
        break;
      case 4:
        isThrowingChecked = true;
        break;
      case 5:
        isChakraChecked = true;
        break;
      case 6:
        isLuckChecked = true;
        break;
      case 7:
        isDodgeChecked = true;
        break;
      default:
        break;
    }
  }

  @override
  void initState() {
    setChecks(widget.character.mainSpe);
    if (widget.character.mainSpe != 0) {
      checkCounter++;
    }
    setChecks(widget.character.secondSpe);
    if (widget.character.secondSpe != 0) {
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
      await widget.character.setSpecialityBuffer(code, add: value);
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
          child: Text("Spécialité",
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
                  Row(
                    children: [
                      //checkbox
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isTaijutsuChecked,
                        onChanged: (bool? value) async {
                          int specialityCode = 1;
                          isTaijutsuChecked = await confirmCheck(
                              code: specialityCode,
                              value: value!,
                              check: isTaijutsuChecked);
                        },
                      ),
                      //mainSpe name
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
                          int specialityCode = 2;
                          isNinjutsuChecked = await confirmCheck(
                              code: specialityCode,
                              value: value!,
                              check: isNinjutsuChecked);
                        },
                      ),
                      //mainSpe name
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
                          int specialityCode = 3;
                          isGenjustsuChecked = await confirmCheck(
                              code: specialityCode,
                              value: value!,
                              check: isGenjustsuChecked);
                        },
                      ),
                      //mainSpe name
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
                          int specialityCode = 4;
                          isThrowingChecked = await confirmCheck(
                              code: specialityCode,
                              value: value!,
                              check: isThrowingChecked);
                        },
                      ),
                      //mainSpe name
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
                          int specialityCode = 5;
                          isChakraChecked = await confirmCheck(
                              code: specialityCode,
                              value: value!,
                              check: isChakraChecked);
                        },
                      ),
                      //mainSpe name
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
                          int specialityCode = 6;
                          isLuckChecked = await confirmCheck(
                              code: specialityCode,
                              value: value!,
                              check: isLuckChecked);
                        },
                      ),
                      //mainSpe name
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
                          int specialityCode = 7;
                          isDodgeChecked = await confirmCheck(
                              code: specialityCode,
                              value: value!,
                              check: isDodgeChecked);
                        },
                      ),
                      //mainSpe name
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
                  // SpecialityDescription(mainSpe: widget.character.mainSpe),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
