// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/utils/assets.dart';

//raiton
//koton
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
          image: "assets/jutsus/katon/fire_ball.jpg",
          ninjutsuMinimum: ninjutsuMinimum,
          malus: malus,
          chakraCost: 15,
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
          image: "assets/jutsus/katon/ash_cloud.jpg",
          ninjutsuMinimum: ninjutsuMinimum,
          malus: malus,
          chakraCost: 10,
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
          image: "assets/jutsus/katon/breath_of_fire.jpg",
          ninjutsuMinimum: ninjutsuMinimum,
          malus: malus,
          chakraCost: 20,
        );
}

class SmallFireBalls extends Jutsu {
  @override
  String name;
  // String description;
  @override
  int ninjutsuMinimum;
  @override
  int malus;

  SmallFireBalls({
    this.name = "Petites Boules de Feu",
    // this.description = "",
    this.ninjutsuMinimum = 45,
    this.malus = 10,
  }) : super(
          name: name,
          // description: "Boule de feu",
          image: "assets/jutsus/katon/small_fire_balls.jpg",
          ninjutsuMinimum: ninjutsuMinimum,
          malus: malus,
          chakraCost: 15,
        );
}

class FlameBurst extends Jutsu {
  @override
  String name;
  // String description;
  @override
  int ninjutsuMinimum;
  @override
  int malus;

  FlameBurst({
    this.name = "Burst ",
    // this.description = "",
    this.ninjutsuMinimum = 70,
    this.malus = 15,
  }) : super(
          name: name,
          // description: "Boule de feu",
          image: "assets/jutsus/katon/flame_burst.jpg",
          ninjutsuMinimum: ninjutsuMinimum,
          malus: malus,
          chakraCost: 25,
        );
}

class FireDragon extends Jutsu {
  @override
  String name;
  // String description;
  @override
  int ninjutsuMinimum;
  @override
  int malus;

  FireDragon({
    this.name = "Dragon de Feu",
    // this.description = "",
    this.ninjutsuMinimum = 85,
    this.malus = 20,
  }) : super(
          name: name,
          // description: "Boule de feu",
          image: "assets/jutsus/katon/fire_dragon.jpg",
          ninjutsuMinimum: ninjutsuMinimum,
          malus: malus,
          chakraCost: 30,
        );
}
