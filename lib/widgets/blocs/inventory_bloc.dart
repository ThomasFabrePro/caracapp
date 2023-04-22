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
      constraints: const BoxConstraints(
        maxWidth: 1000,
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, bottom: 20),
            child: Text("Inventaire",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
            child: Container(
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
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.multiline,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  // keyboardType: TextInputType.text,
                                  // readOnly: true,
                                  decoration: InputDecoration(
                                    fillColor: Colors.black,
                                    border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    hintText: widget.character.inventory,
                                  ),
                                  onChanged: (value) async {
                                    widget.character.setInventory(value);
                                  },
                                  onEditingComplete: () {
                                    widget.character.addToLogsAndUpdate(
                                        "Inventaire mis à jour :\n${widget.character.inventory}");
                                    FocusScope.of(context).unfocus();
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      })),
            ),
          ),
        ],
      ),
    );
  }
}
