import 'dart:math';

import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/widgets/lowerWidgets/jutsu_card.dart';

import '../classes/genjutsus.dart';

class Jutsu {
  final String name;
  final String description;
  final String image;
  final int ninjutsuMinimum;
  final int genjutsuMinimum;
  final int malus;
  final int chakraCost;
  final dynamic type;
  // final int code;

  Jutsu({
    this.name = "",
    this.description = "",
    this.image = "",
    this.ninjutsuMinimum = 0,
    this.genjutsuMinimum = 0,
    this.malus = 0,
    this.chakraCost = 0,
    this.type,
    // this.code = 1,
  });

  int useJutsu(Character character) {
    int random = Random().nextInt(101);
    random -= malus;
    character.chakra -= chakraCost;
    if (random <= 5) {
      return 0; //success crit
    } else if (random >= 95) {
      return 2; //fail crit
    } else if (random > (character.ninjutsu + character.ninjutsuBuffer)) {
      return 1; //fail
    } else {
      return 3; //succes
    }
  }

  JutsuCard toCard(Character character, bool hideIfNotLearned) {
    int statValue = 0;
    int statMinimum = 0;
    bool hide = false;
    String statName = "";
    if (type == Genjutsu) {
      statValue = character.genjutsu + character.genjutsuBuffer;
      statMinimum = genjutsuMinimum;
      statName = "Genjutsu";
    } else {
      statValue = character.ninjutsu + character.ninjutsuBuffer;
      statMinimum = ninjutsuMinimum;
      statName = "Ninjutsu";
    }
    hide = !(statMinimum > statValue && hideIfNotLearned);
    return JutsuCard(
      jutsu: this,
      statValue: statValue,
      chakra: character.chakra,
      hideIfNotLearned: hide,
      minimumStat: statMinimum,
      statName: statName,
    );
  }
}
