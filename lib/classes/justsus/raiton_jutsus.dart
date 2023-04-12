// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';

class Electrocution extends Jutsu {
  Electrocution()
      : super(
          name: "Electrocution",
          description: "Simple éclair de foudre",
          image: "assets/jutsus/raiton/electrocution.jpg",
          ninjutsuMinimum: 45,
          malus: 5,
          chakraCost: 20,
        );
}

class FatalThunder extends Jutsu {
  FatalThunder()
      : super(
          name: "Fatal Foudre",
          description:
              "Déchaine la foudre depuis le ciel pour frapper votre cible",
          image: "assets/jutsus/raiton/fatal_thunder.jpg",
          ninjutsuMinimum: 75,
          malus: 20,
          chakraCost: 30,
        );
}

class Shidori extends Jutsu {
  Shidori()
      : super(
          name: "Shidori",
          description:
              "Foncez vers votre cible pour la pourfendre avec un éclair",
          image: "assets/jutsus/raiton/shidori.jpg",
          ninjutsuMinimum: 55,
          malus: 5,
          chakraCost: 15,
        );
}

class SuperSpeed extends Jutsu {
  SuperSpeed()
      : super(
          name: "Super Vitesse",
          description: "Vous rend beaucoup plus rapide",
          image: "assets/jutsus/raiton/super_speed.jpg",
          ninjutsuMinimum: 30,
          malus: 0,
          chakraCost: 10,
        );
}

class ThunderAbsorption extends Jutsu {
  ThunderAbsorption()
      : super(
          name: "Absorption de Foudre",
          description: "Absorbe la foudre qui se dirige vers vous",
          image: "assets/jutsus/raiton/thunder_absorption.jpg",
          ninjutsuMinimum: 45,
          malus: 5,
          chakraCost: 10,
        );
}

class ThunderWeapon extends Jutsu {
  ThunderWeapon()
      : super(
          name: "Arme Electrique",
          description: "Rend votre arme électrique",
          image: "assets/jutsus/raiton/thunder_weapon.jpg",
          ninjutsuMinimum: 25,
          malus: 0,
          chakraCost: 10,
        );
}
