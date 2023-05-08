// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';

class ProtectiveBalls extends Jutsu {
  ProtectiveBalls()
      : super(
          name: "Boules Protectrices",
          description:
              "Fait tournoyer des boules de gaz défensives autour de vous",
          image: "assets/jutsus/shakuton/protective_balls.jpg",
          ninjutsuMinimum: 40,
          malus: 0,
          chakraCost: 10,
        );
}

class DryOut extends Jutsu {
  DryOut()
      : super(
          name: "Dessechement",
          description: "Desseche la cible au point de la faire fondre",
          image: "assets/jutsus/shakuton/dry_out.jpg",
          ninjutsuMinimum: 65,
          malus: 6,
          chakraCost: 25,
        );
}

class ExplosiveGasBall extends Jutsu {
  ExplosiveGasBall()
      : super(
          name: "Boule de Gaz Explosif",
          description: "Envoie une méga boule de gaz explosif",
          image: "assets/jutsus/shakuton/explosive_gas_ball.jpg",
          ninjutsuMinimum: 75,
          malus: 6,
          chakraCost: 30,
        );
}

class FireAbsorption extends Jutsu {
  FireAbsorption()
      : super(
          name: "Absorption du Feu",
          description: "Absorbe les flammes environnantes",
          image: "assets/jutsus/shakuton/fire_absorption.jpg",
          ninjutsuMinimum: 40,
          malus: 0,
          chakraCost: 10,
        );
}
