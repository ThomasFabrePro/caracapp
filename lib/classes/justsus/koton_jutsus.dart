// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';

class Bullet extends Jutsu {
  Bullet()
      : super(
          name: "Bille de Métal",
          description: "Tire une balle à grande vitesse",
          image: "assets/jutsus/koton/bullet.jpg",
          ninjutsuMinimum: 45,
          malus: 0,
          chakraCost: 10,
        );
}

class StealAffinity extends Jutsu {
  StealAffinity()
      : super(
          name: "Insensibilité",
          description: "vous rend totalement insensible au métal",
          image: "assets/jutsus/koton/steal_affinity.jpg",
          ninjutsuMinimum: 60,
          malus: 4,
          chakraCost: 10,
        );
}

class StealProduction extends Jutsu {
  StealProduction()
      : super(
          name: "Production",
          description:
              "Produit n'importe quel type d'arme en métal, qui disparait moins vite qu'une invocation",
          image: "assets/jutsus/koton/steal_production.jpg",
          ninjutsuMinimum: 55,
          malus: 2,
          chakraCost: 10,
        );
}

class StealSkin extends Jutsu {
  StealSkin()
      : super(
          name: "Peau Métallique",
          description:
              "Vous recouvre d'une peau métallique qui vous rend plus résistant",
          image: "assets/jutsus/koton/steal_skin.jpg",
          ninjutsuMinimum: 45,
          malus: 0,
          chakraCost: 10,
        );
}
