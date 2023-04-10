import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/models/kekkai_model.dart';
import 'package:caracapp/models/primary_element_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/widgets/lowerWidgets/jutsu_card.dart';
import 'package:flutter/material.dart';

class JutsuBloc extends StatefulWidget {
  final Character character;
  const JutsuBloc({super.key, required this.character});

  @override
  State<JutsuBloc> createState() => _JutsuBlocState();
}

class _JutsuBlocState extends State<JutsuBloc> {
  double titleWidthPercent = 0.33;
  int maxCheckCounter = 2;
  int checkCounter = 0;
  int noSpeciality = 0;
  PrimaryElement mainElement = PrimaryElement();
  PrimaryElement secondElement = PrimaryElement();
  Kekkai kekkai = Kekkai();
  TextStyle titleStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: MyDecoration.bloodColor,
  );
  List<List<Jutsu>> jutsusLists = <List<Jutsu>>[];
  List<List<JutsuCard>> jutsuCardsList = <List<JutsuCard>>[
    [],
    [],
    [],
  ];

  @override
  void initState() {
    super.initState();
  }

  Stream<Character> getCharacterJutsus() async* {
    // var random = Random(2);
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      yield widget.character;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [MyDecoration.boxShadow],
      ),
      child: StreamBuilder<Character>(
          stream: getCharacterJutsus(),
          builder: (context, snapshot) {
            mainElement = mainElement.getElement(widget.character.mainElement);
            secondElement =
                secondElement.getElement(widget.character.secondElement);
            kekkai = kekkai.getElement(widget.character.kekkaiGenkai);
            jutsusLists = <List<Jutsu>>[
              mainElement.jutsus,
              secondElement.jutsus,
              kekkai.jutsus,
            ];
            jutsuCardsList = [[], [], []];
            for (int i = 0; i < jutsusLists.length; i++) {
              for (var jutsu in jutsusLists[i]) {
                jutsuCardsList[i].add(
                  JutsuCard(
                    jutsu: jutsu,
                    characterNinjutsuValue: widget.character.ninjutsu +
                        widget.character.ninjutsuBuffer,
                  ),
                );
              }
            }
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Column(
                children: [
                  CardsList(title: mainElement.name, cards: jutsuCardsList[0]),
                  CardsList(
                      title: secondElement.name, cards: jutsuCardsList[1]),
                  CardsList(title: kekkai.name, cards: jutsuCardsList[2]),
                ],
              ),
            );
          }),
    );
  }
}

class CardsList extends StatelessWidget {
  final String title;
  final List<JutsuCard> cards;
  const CardsList({super.key, required this.title, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 10),
        child: Text(
          title,
          style: MyDecoration.titleStyle,
        ),
      ),
      ...cards,
    ]);
  }
}
