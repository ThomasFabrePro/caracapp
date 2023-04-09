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
  bool isSummoningChecked = false;
  bool isSealChecked = false;
  double titleWidthPercent = 0.33;
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

  void setChecks() {
    switch (widget.character.speciality) {
      case 1:
        isTaijutsuChecked = true;
        isGenjustsuChecked = false;
        isNinjutsuChecked = false;
        isThrowingChecked = false;
        isChakraChecked = false;
        isSummoningChecked = false;
        isSealChecked = false;
        break;
      case 2:
        isTaijutsuChecked = false;
        isNinjutsuChecked = true;
        isGenjustsuChecked = false;
        isThrowingChecked = false;
        isChakraChecked = false;
        isSummoningChecked = false;
        isSealChecked = false;
        break;
      case 3:
        isTaijutsuChecked = false;
        isNinjutsuChecked = false;
        isGenjustsuChecked = true;
        isThrowingChecked = false;
        isChakraChecked = false;
        isSummoningChecked = false;
        isSealChecked = false;
        break;
      case 4:
        isTaijutsuChecked = false;
        isNinjutsuChecked = false;
        isGenjustsuChecked = false;
        isThrowingChecked = true;
        isChakraChecked = false;
        isSummoningChecked = false;
        isSealChecked = false;
        break;
      case 5:
        isTaijutsuChecked = false;
        isNinjutsuChecked = false;
        isGenjustsuChecked = false;
        isThrowingChecked = false;
        isChakraChecked = true;
        isSummoningChecked = false;
        isSealChecked = false;
        break;
      case 6:
        isTaijutsuChecked = false;
        isNinjutsuChecked = false;
        isGenjustsuChecked = false;
        isThrowingChecked = false;
        isChakraChecked = false;
        isSummoningChecked = true;
        isSealChecked = false;
        break;
      case 7:
        isTaijutsuChecked = false;
        isNinjutsuChecked = false;
        isGenjustsuChecked = false;
        isThrowingChecked = false;
        isChakraChecked = false;
        isSummoningChecked = false;
        isSealChecked = true;
        break;
      default:
        isTaijutsuChecked = false;
        isNinjutsuChecked = false;
        isGenjustsuChecked = false;
        isThrowingChecked = false;
        isChakraChecked = false;
        isSummoningChecked = false;
        isSealChecked = false;
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
                    int speciality = value == false ? 0 : 1;
                    await widget.character.setSpeciality(speciality);
                    setState(() {
                      widget.character.speciality = speciality;

                      setChecks();
                    });
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
                    int speciality = value == false ? 0 : 2;
                    await widget.character.setSpeciality(speciality);
                    setState(() {
                      widget.character.speciality = speciality;
                      setChecks();
                    });
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
                    int speciality = value == false ? 0 : 3;
                    await widget.character.setSpeciality(speciality);
                    setState(() {
                      widget.character.speciality = speciality;
                      setChecks();
                    });
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
                    int speciality = value == false ? 0 : 4;
                    await widget.character.setSpeciality(speciality);
                    setState(() {
                      widget.character.speciality = speciality;
                      setChecks();
                    });
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
                    int speciality = value == false ? 0 : 5;
                    await widget.character.setSpeciality(speciality);
                    setState(() {
                      widget.character.speciality = speciality;
                      setChecks();
                    });
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
                  value: isSummoningChecked,
                  onChanged: (bool? value) async {
                    int speciality = value == false ? 0 : 6;
                    await widget.character.setSpeciality(speciality);
                    setState(() {
                      widget.character.speciality = speciality;
                      setChecks();
                    });
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
                  value: isSealChecked,
                  onChanged: (bool? value) async {
                    int speciality = value == false ? 0 : 7;
                    await widget.character.setSpeciality(speciality);
                    setState(() {
                      widget.character.speciality = speciality;
                      setChecks();
                    });
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
