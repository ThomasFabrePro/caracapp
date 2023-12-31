// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';

class BlackThunder extends Jutsu {
  BlackThunder()
      : super(
          name: "Foudre Noire",
          description: "Envoie un éclair de foudre noire intense vers la cible",
          image: "assets/jutsus/ranton/black_thunder.jpg",
          ninjutsuMinimum: 50,
          malus: 2,
          chakraCost: 15,
        );
}

class GuidedLasers extends Jutsu {
  GuidedLasers()
      : super(
          name: "Lasers Téléguidés",
          description: "Envoie une salve de lasers téléguidés",
          image: "assets/jutsus/ranton/guided_lasers.jpg",
          ninjutsuMinimum: 55,
          malus: 2,
          chakraCost: 15,
        );
}

class LaserSurge extends Jutsu {
  LaserSurge()
      : super(
          name: "Purge",
          description: "Déferlement de lasers",
          image: "assets/jutsus/ranton/laser_surge.jpg",
          ninjutsuMinimum: 75,
          malus: 6,
          chakraCost: 30,
        );
}

class ThunderPanther extends Jutsu {
  ThunderPanther()
      : super(
          name: "Invocation Panthère",
          description: "Invoque une panthère de foudre noire",
          image: "assets/jutsus/ranton/thunder_panther.jpg",
          ninjutsuMinimum: 65,
          malus: 2,
          chakraCost: 25,
        );
}
