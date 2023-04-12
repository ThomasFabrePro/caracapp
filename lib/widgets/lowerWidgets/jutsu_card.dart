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
    double containerHeight = 90;
    bool isAvailable = jutsu.ninjutsuMinimum < characterNinjutsuValue;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: width,
        height: containerHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset(jutsu.image),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(jutsu.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Coût Chakra : ${jutsu.chakraCost}",
                      style: MyDecoration.dataStyle),
                  Text("Requis : Ninjutsu ≥ ${jutsu.ninjutsuMinimum}",
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
              height: containerHeight,
              decoration: BoxDecoration(
                color: isAvailable ? null : Colors.grey[900]!.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
                // boxShadow: [MyDecoration.boxShadow],
              ),
            )
          ],
        ),
      ),
    );
  }
}
