import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class AttributeBloc extends StatefulWidget {
  final Character character;
  const AttributeBloc({super.key, required this.character});

  @override
  State<AttributeBloc> createState() => _AttributeBlocState();
}

class _AttributeBlocState extends State<AttributeBloc> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
          children: [],
        ),
      ),
    );
  }
}
