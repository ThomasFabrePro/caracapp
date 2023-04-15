import 'package:caracapp/models/jutsu_model.dart';

class WindDragon extends Jutsu {
  WindDragon()
      : super(
          name: "Dragon du Vent",
          description:
              "Fait apparaitre un dragon de vent qui va s'écraser sur la cible",
          image: "assets/jutsus/futon/wind_dragon.jpg",
          ninjutsuMinimum: 85,
          malus: 20,
          chakraCost: 30,
        );
}

class MegaBreath extends Jutsu {
  MegaBreath()
      : super(
          name: "Méga Souffle",
          description: "Repousse l'ennemi avec un souffle puissant",
          image: "assets/jutsus/futon/mega_breath.jpg",
          ninjutsuMinimum: 30,
          malus: 0,
          chakraCost: 10,
        );
}

class Rasengan extends Jutsu {
  Rasengan()
      : super(
          name: "Rasengan",
          description: "Créé une boule de vent pour la projeter sur l'ennemi",
          image: "assets/jutsus/futon/rasengan.jpg",
          ninjutsuMinimum: 55,
          malus: 10,
          chakraCost: 15,
        );
}

class RazorBlades extends Jutsu {
  RazorBlades()
      : super(
          name: "Lames Rasoir",
          description: "Des lames de vent cisaillent la zone devant vous",
          image: "assets/jutsus/futon/razor_blades.jpg",
          ninjutsuMinimum: 40,
          malus: 5,
          chakraCost: 15,
        );
}

class Tornado extends Jutsu {
  Tornado()
      : super(
          name: "Tornade",
          description: "Forme une tornade qui dévaste la zone",
          image: "assets/jutsus/futon/tornado.jpg",
          ninjutsuMinimum: 70,
          malus: 15,
          chakraCost: 25,
        );
}

class WindBlade extends Jutsu {
  WindBlade()
      : super(
          name: "Arme du Vent",
          description: "Votre arme devient plus coupante que le vent",
          image: "assets/jutsus/futon/wind_blade.jpg",
          ninjutsuMinimum: 25,
          malus: 0,
          chakraCost: 10,
        );
}
