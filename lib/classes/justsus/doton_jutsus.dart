// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';

class Dome extends Jutsu {
  Dome()
      : super(
          name: "Dome de Pierre",
          description:
              "Créé un dôme de pierre sur un autre ninja pour le protéger ou l'immobiliser",
          image: "assets/jutsus/doton/dome.jpg",
          ninjutsuMinimum: 45,
          malus: 5,
          chakraCost: 20,
        );
}

class MudTermiteMound extends Jutsu {
  MudTermiteMound()
      : super(
          name: "Termitière",
          description:
              "Une grosse termitière pousse rapidement sous un ninja pour le bloquer et le blesser",
          image: "assets/jutsus/doton/mud_termite_mound.jpg",
          ninjutsuMinimum: 35,
          malus: 5,
          chakraCost: 15,
        );
}

class MultiRockClones extends Jutsu {
  MultiRockClones()
      : super(
          name: "Multi Clones",
          description: "Invoque 3 clones de pierre pour vous aider",
          image: "assets/jutsus/doton/multi_rock_clone.jpg",
          ninjutsuMinimum: 60,
          malus: 10,
          chakraCost: 25,
        );
}

class RockGolem extends Jutsu {
  RockGolem()
      : super(
          name: "Golem",
          description: "Invoque un gros golem de pierre très résistant",
          image: "assets/jutsus/doton/rock_golem.jpg",
          ninjutsuMinimum: 75,
          malus: 20,
          chakraCost: 35,
        );
}

class RockJavelin extends Jutsu {
  RockJavelin()
      : super(
          name: "Javelot",
          description: "Envoie un javelot vers votre cible",
          image: "assets/jutsus/doton/rock_javelin.jpg",
          ninjutsuMinimum: 55,
          malus: 0,
          chakraCost: 10,
        );
}

class RockWall extends Jutsu {
  RockWall()
      : super(
          name: "Mur de Pierre",
          description: "Fait apparaitre un mur de pierre où vous le souhaitez",
          image: "assets/jutsus/doton/rock_wall.jpg",
          ninjutsuMinimum: 35,
          malus: 5,
          chakraCost: 10,
        );
}
