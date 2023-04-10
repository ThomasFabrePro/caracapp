// ignore_for_file: overridden_fields

import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/utils/assets.dart';

class FireBall extends Jutsu {
  @override
  String name;
  // String description;
  @override
  int ninjutsuMinimum;
  @override
  int malus;

  FireBall({
    this.name = "Boule de Feu",
    // this.description = "Boule de feu",
    this.ninjutsuMinimum = 50,
    this.malus = 5,
  }) : super(
          name: name,
          // description: description,
          image: MyImages().imagePath[image.jutsuFireBall]!,
          ninjutsuMinimum: ninjutsuMinimum,
          malus: malus,
        );
}

class AshCloud extends Jutsu {
  @override
  String name;
  // String description;
  @override
  int ninjutsuMinimum;
  @override
  int malus;

  AshCloud({
    this.name = "Fumée Explosive",
    // this.description = "",
    this.ninjutsuMinimum = 30,
    this.malus = 0,
  }) : super(
          name: name,
          // description: "Boule de feu",
          image: MyImages().imagePath[image.jutsuAshCloud]!,
          ninjutsuMinimum: ninjutsuMinimum,
          malus: malus,
        );
}

class BreathOfFire extends Jutsu {
  @override
  String name;
  // String description;
  @override
  int ninjutsuMinimum;
  @override
  int malus;

  BreathOfFire({
    this.name = "Souffle de feu",
    // this.description = "",
    this.ninjutsuMinimum = 60,
    this.malus = 10,
  }) : super(
          name: name,
          // description: "Boule de feu",
          image: MyImages().imagePath[image.jutsuBreathOfFire]!,
          ninjutsuMinimum: ninjutsuMinimum,
          malus: malus,
        );
}
