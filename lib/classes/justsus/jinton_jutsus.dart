// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';

class MagicCube extends Jutsu {
  MagicCube()
      : super(
          name: "Cube Magique",
          description:
              "Créé un petit cube de vide qui désintègre tout ce qui se trouve dedans",
          image: "assets/jutsus/jinton/magic_cube.jpg",
          ninjutsuMinimum: 60,
          malus: 10,
          chakraCost: 25,
        );
}

class ProtectiveDust extends Jutsu {
  ProtectiveDust()
      : super(
          name: "Poussière Protectrice",
          description:
              "Vous enveloppe d'un voile de poussière. Réduit les chances d'etre touché par du Taijutsu",
          image: "assets/jutsus/jinton/protective_dust.jpg",
          ninjutsuMinimum: 45,
          malus: 5,
          chakraCost: 10,
        );
}

class VoidNiddle extends Jutsu {
  VoidNiddle()
      : super(
          name: "Aiguille du Vide",
          description:
              "Lance une aiguille qui transperce tout ce qu'elle touche",
          image: "assets/jutsus/jinton/void_pic.jpg",
          ninjutsuMinimum: 55,
          malus: 5,
          chakraCost: 10,
        );
}
