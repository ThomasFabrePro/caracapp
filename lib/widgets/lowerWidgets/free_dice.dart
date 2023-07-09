import 'package:flutter/material.dart';

class FreeDice extends StatefulWidget {
  const FreeDice({super.key});

  @override
  State<FreeDice> createState() => _FreeDiceState();
}

class _FreeDiceState extends State<FreeDice> {
  int diceValue = 0;
  int numberOfDice = 0;
  double spacing = 20;
  @override
  Widget build(BuildContext context) {
    String middleText = numberOfDice > 1 ? "dés de" : "dé de";
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(),
          const Text("Lancer "),
          // SizedBox(width: spacing),
          Container(
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: numberOfDice == 0 ? Colors.red : Colors.green,
                width: 2,
              ),
            ),
            child: TextFormField(
              initialValue: numberOfDice.toString(),
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  // borde
                ),
                hintText: "0",
              ),
              onFieldSubmitted: (value) {
                setState(() {
                  numberOfDice = int.tryParse(value) ?? 0;
                  // value = numberOfDice.isNaN ? "0" : value;
                });
              },
            ),
          ),
          // SizedBox(width: spacing),
          Text(middleText),
          Container(
            width: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: diceValue == 0 ? Colors.red : Colors.green,
                width: 2,
              ),
            ),
            child: TextFormField(
              initialValue: numberOfDice.toString(),
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                  // borderRadius: BorderRadius.circular(40),
                  // gapPadding: 0,
                  // borde
                ),
                hintText: "0",
              ),
              onFieldSubmitted: (value) {
                setState(() {
                  diceValue = int.tryParse(value) ?? 0;
                  // value = numberOfDice.isNaN ? "0" : value;
                });
              },
            ),
          ),
          GestureDetector(
            onTap: () async {},
            child: const Icon(
              Icons.delete_outline,
              size: 40,
            ),
          ),
          const SizedBox(),
        ],
      ),
    );
  }
}
