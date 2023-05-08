// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';

class Arena extends Jutsu {
  Arena()
      : super(
          name: "Arène",
          description:
              "Fait apparaitre des piliers à pointes autour de vous et votre cible",
          image: "assets/jutsus/mokuton/arena.jpg",
          ninjutsuMinimum: 50,
          malus: 0,
          chakraCost: 15,
        );
}

class GreatGrowth extends Jutsu {
  GreatGrowth()
      : super(
          name: "Croissance Accélérée",
          description: "Envoie une volée de pieux de bois",
          image: "assets/jutsus/mokuton/great_growth.jpg",
          ninjutsuMinimum: 50,
          malus: 0,
          chakraCost: 10,
        );
}

class Hindrance extends Jutsu {
  Hindrance()
      : super(
          name: "Entrave",
          description: "Entrave la cible",
          image: "assets/jutsus/mokuton/hindrance.jpg",
          ninjutsuMinimum: 45,
          malus: 0,
          chakraCost: 15,
        );
}

// class WoodenGolem extends Jutsu {
//   WoodenGolem()
//       : super(
//           name: "Golem de bois",
//           description: "Invoque un gros golem de bois",
//           image: "assets/jutsus/mokuton/wooden_golem.jpg",
//           ninjutsuMinimum: 70,
//           malus: 15,
//           chakraCost: 25,
//         );
// }
