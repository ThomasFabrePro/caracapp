import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class JutsuCard extends StatelessWidget {
  final Jutsu jutsu;
  final int characterNinjutsuValue;
  const JutsuCard(
      {super.key, required this.jutsu, required this.characterNinjutsuValue});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isAvailable = jutsu.ninjutsuMinimum < characterNinjutsuValue;
    return Container(
      width: width,
      height: 80,
      child: Stack(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                height: 70,
                width: 70,
                child: Image.asset(jutsu.image),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(jutsu.description, style: MyDecoration.dataStyle),
                Text("Ninjutsu ≥ ${jutsu.ninjutsuMinimum}",
                    style: TextStyle(
                      color: isAvailable ? Colors.black : Colors.red,
                      fontSize: 18,
                    )),
                Text("Malus au dé : ${jutsu.malus}",
                    style: MyDecoration.dataStyle),
              ],
            ),
          ]),
          Container(
            width: width,
            height: 80,
            color: isAvailable ? null : Colors.grey[900]!.withOpacity(0.5),
          )
        ],
      ),
    );
  }
}
