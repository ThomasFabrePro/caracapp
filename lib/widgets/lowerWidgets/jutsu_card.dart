import 'package:caracapp/models/jutsu_model.dart';
import 'package:flutter/material.dart';

class JutsuCard extends StatelessWidget {
  final Jutsu jutsu;
  const JutsuCard({super.key, required this.jutsu});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.pink,
      child: Text(jutsu.name),
    );
  }
}
