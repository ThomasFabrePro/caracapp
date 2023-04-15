import 'dart:math';

import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class InventoryBloc extends StatefulWidget {
  final Character character;
  const InventoryBloc({super.key, required this.character});

  @override
  State<InventoryBloc> createState() => _InventoryBlocState();
}

class _InventoryBlocState extends State<InventoryBloc> {
  Stream<Character> getCharacterStats() async* {
    // var random = Random(2);
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield widget.character;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = double.infinity;
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
          child: StreamBuilder<Character>(
              stream: getCharacterStats(),
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: width,
                      // height: 40,
                      child: Container(
                        // color: Colors.white,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          // boxShadow: [
                          //   MyDecoration.textFieldBoxShadow,
                          // ],
                        ),
                        child: TextFormField(
                          initialValue: widget.character.inventory,
                          maxLines: null,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          // keyboardType: TextInputType.text,
                          // readOnly: true,
                          decoration: InputDecoration(
                            fillColor: Colors.black,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: widget.character.inventory,
                          ),
                          onChanged: (value) async {
                            // widget.onChanged(value);
                            print("TEST value: $value");
                            widget.character.setInventory(value);
                          },
                        ),
                      ),
                    ),
                  ],
                );
              })),
    );
  }
}
