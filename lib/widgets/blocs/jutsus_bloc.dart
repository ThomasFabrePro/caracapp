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
  final bool updateBlocOntimer;
  final bool hideUnavailableJutsus;
  const JutsuBloc(
      {super.key,
      this.updateBlocOntimer = true,
      this.hideUnavailableJutsus = true,
      required this.character});

  @override
  State<JutsuBloc> createState() => _JutsuBlocState();
}

class _JutsuBlocState extends State<JutsuBloc> {
  Character character = Character();
  double titleWidthPercent = 0.33;
  int maxCheckCounter = 2;
  int checkCounter = 0;
  int noSpeciality = 0;
  PrimaryElement mainElement = PrimaryElement();
  PrimaryElement secondElement = PrimaryElement();
  Kekkai kekkai = Kekkai();
  Genjutsu genjutsu = Genjutsu();
  TextStyle titleStyle = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: MyDecoration.bloodColor,
  );
  List<List<Jutsu>> jutsusLists = <List<Jutsu>>[];
  List<List<JutsuCard>> jutsuCardsList = <List<JutsuCard>>[[], [], []];
  Timer? timerRebuild;
  int main = 0;
  int second = 0;
  int ninjutsuValue = 0;
  int genjutsuValue = 0;
  @override
  void initState() {
    super.initState();
    character = widget.character;
    setUsefullValues(); //important pour le setState
    if (widget.updateBlocOntimer) {
      timerRebuild = Timer.periodic(const Duration(seconds: 2), (timer) async {
        // await Future.delayed(const Duration(seconds: 2));
        Character newCharacter = await widget.character.getCharacter();
        int newCharacterActualNinjutsu =
            newCharacter.ninjutsu + newCharacter.ninjutsuBuffer;
        int newCharacterActualGenjutsu =
            newCharacter.genjutsu + newCharacter.genjutsuBuffer;
        if (newCharacter.mainElement != main ||
            newCharacter.secondElement != second ||
            newCharacterActualNinjutsu != ninjutsuValue ||
            newCharacterActualGenjutsu != genjutsuValue) {
          setState(() {
            character = newCharacter;
          });
          print("Test setState");
        }
      });
    }
  }

  void setUsefullValues() {
    main = widget.character.mainElement; //important pour le setState
    second = widget.character.secondElement; //important pour le setState
    ninjutsuValue = widget.character.ninjutsu +
        widget.character.ninjutsuBuffer; //important pour le setState
    genjutsuValue = widget.character.genjutsu +
        widget.character.genjutsuBuffer; //important pour le setState
  }

  void fillLists() {
    jutsuCardsList = [[], [], [], []];
    int i;
    for (i = 0; i < jutsusLists.length; i++) {
      for (var jutsu in jutsusLists[i]) {
        if (!(jutsu.ninjutsuMinimum >
                widget.character.ninjutsu + widget.character.ninjutsuBuffer &&
            widget.hideUnavailableJutsus)) {
          jutsuCardsList[i].add(
            JutsuCard(
              jutsu: jutsu,
              statValue:
                  widget.character.ninjutsu + widget.character.ninjutsuBuffer,
            ),
          );
        }
      }
    }
    for (var jutsu in genjutsu.jutsus) {
      //! Ajout des Genjutsus
      if (!(jutsu.genjutsuMinimum >
              widget.character.genjutsu + widget.character.genjutsuBuffer &&
          widget.hideUnavailableJutsus)) {
        jutsuCardsList[i].add(JutsuCard(
          jutsu: jutsu,
          statValue:
              widget.character.genjutsu + widget.character.genjutsuBuffer,
          isGenjutsu: true,
        ));
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
    setUsefullValues();
    mainElement = mainElement.getElement(main);
    secondElement = secondElement.getElement(second);
    kekkai = kekkai.getElement(widget.character.kekkaiGenkai);
    jutsusLists = <List<Jutsu>>[
      mainElement.jutsus,
      secondElement.jutsus,
      kekkai.jutsus,
    ];
    fillLists();
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text("Jutsus",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 1000,
            ),
            width: width,
            // decoration: BoxDecoration(
            //   // color: Colors.white,
            //   borderRadius: BorderRadius.circular(10),
            //   // boxShadow: [MyDecoration.boxShadow],
            // ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
              ),
              child: Column(
                children: [
                  jutsuCardsList[0].isNotEmpty
                      ? CardsList(
                          element: mainElement, cards: jutsuCardsList[0])
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
