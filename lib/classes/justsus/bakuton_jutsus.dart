// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';

class Explosion extends Jutsu {
  Explosion()
      : super(
          name: "Explosion",
          description:
              "Fait exploser toute la zone autour de vous sur 20 mètres",
          image: "assets/jutsus/bakuton/explosion.jpg",
          ninjutsuMinimum: 80,
          malus: 8,
          chakraCost: 30,
        );
}

class ExplosiveHands extends Jutsu {
  ExplosiveHands()
      : super(
          name: "Paume Explosive",
          description: "Produit une explosion à partir de votre main",
          image: "assets/jutsus/bakuton/explosive_hand.jpg",
          ninjutsuMinimum: 25,
          malus: 0,
          chakraCost: 5,
        );
}

class Scolopandre extends Jutsu {
  Scolopandre()
      : super(
          name: "Invocation Scolopandre",
          description:
              "Invoque un gros scolopandre qui rampe vers la cible et explose",
          image: "assets/jutsus/bakuton/scolopandre.jpg",
          ninjutsuMinimum: 50,
          malus: 2,
          chakraCost: 15,
        );
}

class BigBird extends Jutsu {
  BigBird()
      : super(
          name: "Invocation Oiseau",
          description: "Invoque un gros oiseau capable de vous faire voler",
          image: "assets/jutsus/bakuton/summon_big_bird.jpg",
          ninjutsuMinimum: 65,
          malus: 4,
          chakraCost: 20,
        );
}
