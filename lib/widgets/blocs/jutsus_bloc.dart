// ignore_for_file: avoid_print
import 'dart:async';
import 'package:caracapp/classes/genjutsus.dart';
import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/models/element_model.dart';
import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/models/kekkai_model.dart';
import 'package:caracapp/models/primary_element_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/widgets/lowerWidgets/jutsu_card.dart';
import 'package:flutter/material.dart';

class JutsuBloc extends StatefulWidget {
  final Character character;
  final bool hideNotLearnedJutsus;
  const JutsuBloc(
      {super.key, this.hideNotLearnedJutsus = true, required this.character});

  @override
  State<JutsuBloc> createState() => _JutsuBlocState();
}

class _JutsuBlocState extends State<JutsuBloc> {
  bool hideNotLearnedJutsus = false;
  PrimaryElement mainElement = PrimaryElement();
  PrimaryElement secondElement = PrimaryElement();
  Kekkai kekkai = Kekkai();
  PrimaryElement genjutsu = PrimaryElement();
  List<List<Jutsu>> jutsusLists = <List<Jutsu>>[];
  List<List<JutsuCard>> jutsuCardsList = <List<JutsuCard>>[[], [], [], []];
  Timer? timerRebuild;

  @override
  void initState() {
    super.initState();
    timerRebuild = Timer.periodic(const Duration(seconds: 2), (timer) async {
      setState(() {});
    });
  }

  void fillLists() {
    mainElement = mainElement.getElement(widget.character.mainElement);
    secondElement = secondElement.getElement(widget.character.secondElement);
    kekkai = kekkai.getElement(widget.character.kekkaiGenkai);
    genjutsu = widget.character.hasGenjutsu;
    jutsusLists = <List<Jutsu>>[
      mainElement.jutsus,
      secondElement.jutsus,
      kekkai.jutsus,
      genjutsu.jutsus,
    ];
    jutsuCardsList = [[], [], [], []];
    int index;
    for (index = 0; index < jutsusLists.length; index++) {
      for (var jutsu in jutsusLists[index]) {
        jutsuCardsList[index]
            .add(jutsu.toCard(widget.character, hideNotLearnedJutsus));
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    timerRebuild?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    fillLists();
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 1000,
          ),
          width: width,
          child: Stack(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text("Jutsus",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 40,
                      color: const Color.fromARGB(172, 255, 255, 255),
                      child: Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          return MyDecoration.bloodColor;
                        }),
                        value: !hideNotLearnedJutsus,
                        onChanged: (bool? value) async {
                          setState(() {
                            hideNotLearnedJutsus = !hideNotLearnedJutsus;
                          });
                          // await widget.character.setHideUnavailableJutsus(value);
                        },
                      ),
                    ),
                    //mainElement name
                    Container(
                      height: 40,
                      color: const Color.fromARGB(172, 255, 255, 255),
                      child: const SizedBox(
                        child: Center(
                          child: Text(
                            "Tous  ",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: MyDecoration.bloodColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),
            width: width,
            child: Column(
              children: [
                jutsuCardsList[0].isNotEmpty
                    ? CardsList(element: mainElement, cards: jutsuCardsList[0])
                    : const SizedBox(),
                jutsuCardsList[1].isNotEmpty
                    ? CardsList(
                        element: secondElement, cards: jutsuCardsList[1])
                    : const SizedBox(),
                jutsuCardsList[2].isNotEmpty
                    ? CardsList(element: kekkai, cards: jutsuCardsList[2])
                    : const SizedBox(),
                jutsuCardsList[3].isNotEmpty
                    ? CardsList(element: genjutsu, cards: jutsuCardsList[3])
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CardsList extends StatelessWidget {
  final NatureElement element;
  final List<JutsuCard> cards;
  const CardsList({super.key, required this.element, required this.cards});

  @override
  Widget build(BuildContext context) {
    cards.sort(
        (a, b) => a.jutsu.ninjutsuMinimum.compareTo(b.jutsu.ninjutsuMinimum));

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 8, top: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              element.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(height: 30, child: Image.asset(element.image))
          ],
        ),
      ),
      ...cards,
    ]);
  }
}
