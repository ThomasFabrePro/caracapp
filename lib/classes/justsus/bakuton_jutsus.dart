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
          malus: 20,
          chakraCost: 35,
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
          chakraCost: 10,
        );
}

class Scolopandre extends Jutsu {
  Scolopandre()
      : super(
          name: "Invocation Scolopandre",
          description: "Invoque un gros scolopandre",
          image: "assets/jutsus/bakuton/scolopandre.jpg",
          ninjutsuMinimum: 45,
          malus: 5,
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
          malus: 15,
          chakraCost: 20,
        );
}
