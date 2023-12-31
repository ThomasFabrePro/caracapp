// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';

class FireBall extends Jutsu {
  FireBall()
      : super(
          name: "Boule de Feu",
          description: "Envoie une boule de feu sur l'ennemi",
          image: "assets/jutsus/katon/fire_ball.jpg",
          ninjutsuMinimum: 50,
          malus: 4,
          chakraCost: 15,
        );
}

class AshCloud extends Jutsu {
  AshCloud()
      : super(
          name: "Fumée Explosive",
          description: "Crache un panache de fumée qui explose sur commande",
          image: "assets/jutsus/katon/ash_cloud.jpg",
          ninjutsuMinimum: 35,
          malus: 0,
          chakraCost: 10,
        );
}

class BreathOfFire extends Jutsu {
  BreathOfFire()
      : super(
          name: "Souffle de feu",
          description:
              "Brule tout ce qui se trouve devant vous dans une vague de flammes",
          image: "assets/jutsus/katon/breath_of_fire.jpg",
          ninjutsuMinimum: 60,
          malus: 4,
          chakraCost: 20,
        );
}

class SmallFireBalls extends Jutsu {
  SmallFireBalls()
      : super(
          name: "Petites Boules de Feu",
          description: "Expulse des petites boules de feu autour de vous",
          image: "assets/jutsus/katon/small_fire_balls.jpg",
          ninjutsuMinimum: 45,
          malus: 4,
          chakraCost: 10,
        );
}

class FlameBurst extends Jutsu {
  FlameBurst()
      : super(
          name: "Burst",
          description:
              "Crache une colonne de feu capable de désintégrer la cible",
          image: "assets/jutsus/katon/flame_burst.jpg",
          ninjutsuMinimum: 70,
          malus: 8,
          chakraCost: 25,
        );
}

class FireDragon extends Jutsu {
  FireDragon()
      : super(
          name: "Dragon de Feu",
          description:
              "Envoie une énorme flamme en forme de dragon qui suit la cible sans relâche",
          image: "assets/jutsus/katon/fire_dragon.jpg",
          ninjutsuMinimum: 85,
          malus: 8,
          chakraCost: 30,
        );
}
