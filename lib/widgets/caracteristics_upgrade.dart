import 'package:flutter/material.dart';

class CaracteristicsUpgrade extends StatefulWidget {
  const CaracteristicsUpgrade({super.key});

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
      ),
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [Text("data")],
          )),
    );
  }
}
