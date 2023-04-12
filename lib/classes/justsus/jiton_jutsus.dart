// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';

class Attraction extends Jutsu {
  Attraction()
      : super(
          name: "Attraction",
          description: "Attire tout le monde autour de vous",
          image: "assets/jutsus/jiton/attraction.jpg",
          ninjutsuMinimum: 50,
          malus: 5,
          chakraCost: 5,
        );
}

class Repulsion extends Jutsu {
  Repulsion()
      : super(
          name: "Répulsion",
          description: "Repousse tout le monde autour de vous",
          image: "assets/jutsus/jiton/repulsion.jpg",
          ninjutsuMinimum: 50,
          malus: 5,
          chakraCost: 5,
        );
}

class FlyingSticks extends Jutsu {
  FlyingSticks()
      : super(
          name: "Matraques Volantes",
          description: "Envoie une série de pieux en métal",
          image: "assets/jutsus/jiton/flying_sticks.jpg",
          ninjutsuMinimum: 45,
          malus: 5,
          chakraCost: 15,
        );
}

class Destruction extends Jutsu {
  Destruction()
      : super(
          name: "Destruction",
          description:
              "Agrège une énorme boule de roche pour la faire retomber sur la cible",
          image: "assets/jutsus/jiton/destruction.jpg",
          ninjutsuMinimum: 70,
          malus: 15,
          chakraCost: 25,
        );
}
