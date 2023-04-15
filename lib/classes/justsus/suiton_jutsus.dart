// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/utils/assets.dart';

class WaterDragon extends Jutsu {
  WaterDragon()
      : super(
          name: "Dragon d'Eau",
          description:
              "Crée un énorme dragon liquide, qui frappe l'adversaire avec une formidable puissance",
          image: "assets/jutsus/suiton/water_dragon.jpg",
          ninjutsuMinimum: 85,
          malus: 20,
          chakraCost: 30,
        );
}

class WaterSword extends Jutsu {
  WaterSword()
      : super(
          name: "Épée d'Eau",
          description: "Votre arme devient un sabre d'eau",
          image: "assets/jutsus/suiton/water_sword.jpg",
          ninjutsuMinimum: 25,
          malus: 0,
          chakraCost: 10,
        );
}

class WaterClone extends Jutsu {
  WaterClone()
      : super(
          name: "Clone d'Eau",
          description: "Invoque un clone d'eau",
          image: "assets/jutsus/suiton/water_clone.jpg",
          ninjutsuMinimum: 35,
          malus: 5,
          chakraCost: 5,
        );
}

class WaterPrison extends Jutsu {
  WaterPrison()
      : super(
          name: "Prison d'Eau",
          description:
              "Enferme la cible dans une prison d'eau capable de la noyer",
          image: "assets/jutsus/suiton/water_prison.jpg",
          ninjutsuMinimum: 45,
          malus: 10,
          chakraCost: 15,
        );
}

class Tsunami extends Jutsu {
  Tsunami()
      : super(
          name: "Tsunami",
          description: "Fait surgir un tsunami qui s'abat sur la zone",
          image: "assets/jutsus/suiton/tsunami.jpg",
          ninjutsuMinimum: 75,
          malus: 25,
          chakraCost: 30,
        );
}

class WaterRelease extends Jutsu {
  WaterRelease()
      : super(
          name: "Karcher",
          description: "Envoie un jet d'eau à haute pression devant vous",
          image: "assets/jutsus/suiton/water_release.jpg",
          ninjutsuMinimum: 55,
          malus: 10,
          chakraCost: 20,
        );
}
