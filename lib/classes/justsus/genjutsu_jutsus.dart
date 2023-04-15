// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';

class Trance extends Jutsu {
  Trance()
      : super(
          name: "Transe révélatrice",
          description:
              "Plonge votre adversaire dans une sorte de transe. Vous avez alors accès à ses souvenirs",
          image: "assets/jutsus/genjutsu/trance.jpg",
          genjutsuMinimum: 40,
          ninjutsuMinimum:
              40, //Mettre obligatoirement le meme que genjutsuMinimum
          malus: 0,
          chakraCost: 5,
        );
}

class Terror extends Jutsu {
  Terror()
      : super(
          name: "Terreur",
          description:
              "La victime verra sa pire frayeur, si bien qu'elle se retrouve tétanisée par la peur",
          image: "assets/jutsus/genjutsu/terror.jpg",
          genjutsuMinimum: 45,
          ninjutsuMinimum:
              45, //Mettre obligatoirement le meme que genjutsuMinimum
          malus: 5,
          chakraCost: 10,
        );
}

class Permutation extends Jutsu {
  Permutation()
      : super(
          name: "Permutation",
          description:
              "Vous permet d'esquiver un coup en laissant un clone le prendre à votre place",
          image: "assets/jutsus/genjutsu/permutation.jpg",
          genjutsuMinimum: 55,
          ninjutsuMinimum:
              55, //Mettre obligatoirement le meme que genjutsuMinimum
          malus: 5,
          chakraCost: 10,
        );
}

class Execution extends Jutsu {
  Execution()
      : super(
          name: "Exécution",
          description: "La victime vit sa propre mort à travers une illusion",
          image: "assets/jutsus/genjutsu/execution.jpg",
          genjutsuMinimum: 60,
          ninjutsuMinimum:
              60, //Mettre obligatoirement le meme que genjutsuMinimum
          malus: 10,
          chakraCost: 15,
        );
}

class Vanish extends Jutsu {
  Vanish()
      : super(
          name: "Disparition",
          description: "Votre cible devient incapable de vous voir",
          image: "assets/jutsus/genjutsu/vanish.jpg",
          genjutsuMinimum: 65,
          ninjutsuMinimum:
              65, //Mettre obligatoirement le meme que genjutsuMinimum
          malus: 10,
          chakraCost: 15,
        );
}

class DivineOrder extends Jutsu {
  DivineOrder()
      : super(
          name: "Ordre Divin",
          description:
              "Permet de contrôler une personne sans que cette dernière ne le réalise",
          image: "assets/jutsus/genjutsu/divine_order.jpg",
          genjutsuMinimum: 80,
          ninjutsuMinimum:
              80, //Mettre obligatoirement le meme que genjutsuMinimum
          malus: 25,
          chakraCost: 15,
        );
}
