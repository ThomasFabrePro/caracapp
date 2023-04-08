import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class CaracteristicsUpgrade extends StatefulWidget {
  final Character character;
  const CaracteristicsUpgrade({super.key, required this.character});

  @override
  State<CaracteristicsUpgrade> createState() => _CaracteristicsUpgradeState();
}

class _CaracteristicsUpgradeState extends State<CaracteristicsUpgrade> {
  @override
  Widget build(BuildContext context) {
    double width = double.infinity;
    return Container(
      width: width,
      height: 200,
      // color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [MyDecoration.boxShadow],
      ),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[Text("data")],
          )),
    );
  }
}
