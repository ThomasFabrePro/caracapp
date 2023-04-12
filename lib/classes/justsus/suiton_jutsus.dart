// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/utils/assets.dart';

class WaterDragon extends Jutsu {
  @override
  String name;
  // String description;
  @override
  int ninjutsuMinimum;
  @override
  int malus;

  WaterDragon({
    this.name = "Dragon d'Eau",
    // this.description = "Boule de feu",
    this.ninjutsuMinimum = 85,
    this.malus = 20,
  }) : super(
          name: name,
          // description: description,
          image: MyImages().imagePath[image.jutsuWaterDragon]!,
          ninjutsuMinimum: ninjutsuMinimum,
          malus: malus,
          chakraCost: 30,
        );
}

class WaterSword extends Jutsu {
  @override
  String name;
  // String description;
  @override
  int ninjutsuMinimum;
  @override
  int malus;

  WaterSword({
    this.name = "Épée d'Eau",
    // this.description = "Boule de feu",
    this.ninjutsuMinimum = 25,
    this.malus = 0,
  }) : super(
          name: name,
          // description: description,
          image: MyImages().imagePath[image.jutsuWaterSword]!,
          ninjutsuMinimum: ninjutsuMinimum,
          malus: malus,
          chakraCost: 10,
        );
}

class WaterClone extends Jutsu {
  @override
  String name;
  // String description;
  @override
  int ninjutsuMinimum;
  @override
  int malus;

  WaterClone({
    this.name = "Clone d'Eau",
    // this.description = "Boule de feu",
    this.ninjutsuMinimum = 35,
    this.malus = 5,
  }) : super(
          name: name,
          // description: description,
          image: MyImages().imagePath[image.jutsuWaterClone]!,
          ninjutsuMinimum: ninjutsuMinimum,
          malus: malus,
          chakraCost: 5,
        );
}

class WaterPrison extends Jutsu {
  @override
  String name;
  // String description;
  @override
  int ninjutsuMinimum;
  @override
  int malus;

  WaterPrison({
    this.name = "Prison d'Eau",
    // this.description = "Boule de feu",
    this.ninjutsuMinimum = 45,
    this.malus = 10,
  }) : super(
          name: name,
          // description: description,
          image: MyImages().imagePath[image.jutsuWaterPrison]!,
          ninjutsuMinimum: ninjutsuMinimum,
          malus: malus,
          chakraCost: 15,
        );
}

class Tsunami extends Jutsu {
  @override
  String name;
  // String description;
  @override
  int ninjutsuMinimum;
  @override
  int malus;

  Tsunami({
    this.name = "Tsunami",
    // this.description = "Boule de feu",
    this.ninjutsuMinimum = 70,
    this.malus = 25,
  }) : super(
          name: name,
          // description: description,
          image: MyImages().imagePath[image.jutsuTsunami]!,
          ninjutsuMinimum: ninjutsuMinimum,
          malus: malus,
          chakraCost: 30,
        );
}

class WaterRelease extends Jutsu {
  @override
  String name;
  // String description;
  @override
  int ninjutsuMinimum;
  @override
  int malus;

  WaterRelease({
    this.name = "Torrent",
    // this.description = "Boule de feu",
    this.ninjutsuMinimum = 50,
    this.malus = 10,
  }) : super(
          name: name,
          // description: description,
          image: MyImages().imagePath[image.jutsuWaterRelease]!,
          ninjutsuMinimum: ninjutsuMinimum,
          malus: malus,
          chakraCost: 20,
        );
}
