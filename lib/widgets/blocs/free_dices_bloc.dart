import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/widgets/lowerWidgets/free_dice.dart';
import 'package:caracapp/widgets/lowerWidgets/upgrade_caracteristic.dart';
import 'package:flutter/material.dart';

class FreeDicesBloc extends StatefulWidget {
  final Character character;
  final bool isEditable;
  const FreeDicesBloc({
    super.key,
    required this.character,
    this.isEditable = true,
  });

  @override
  State<FreeDicesBloc> createState() => _FreeDicesBlocState();
}

class _FreeDicesBlocState extends State<FreeDicesBloc> {
  late bool isEditable;
  @override
  void initState() {
    super.initState();
    isEditable = widget.isEditable;
  }

  Stream<Character> getCharacterStats() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield widget.character;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = double.infinity;
    return Center(
      child: Column(
        children: [
          // Center(
          //   child: Container(
          //     constraints: const BoxConstraints(
          //       maxWidth: 1000,
          //     ),
          //     width: width,
          //     child: const Center(
          //       child: Padding(
          //         padding: EdgeInsets.only(
          //           bottom: 20,
          //         ),
          //         child: Text("Caractéristiques",
          //             style: TextStyle(
          //               fontSize: 22,
          //               color: Colors.white,
          //               fontWeight: FontWeight.bold,
          //             )),
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
              padding: const EdgeInsets.only(
                  bottom: 16.0, left: 16.0, right: 16.0, top: 32),
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 1000,
                ),
                // width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StreamBuilder<Character>(
                        stream: getCharacterStats(),
                        builder: (context, snapshot) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              FreeDice(),
                            ],
                          );
                        })),
              ))
        ],
      ),
    );
  }
}
