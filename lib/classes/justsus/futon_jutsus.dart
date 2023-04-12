import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/utils/assets.dart';

class WindDragon extends Jutsu {
  WindDragon()
      : super(
          name: "Dragon du Vent",
          // description: description,
          image: "assets/jutsus/wind/wind_dragon.jpg",
          ninjutsuMinimum: 85,
          malus: 20,
          chakraCost: 30,
        );
}

class MegaBreath extends Jutsu {
  MegaBreath()
      : super(
          name: "Méga Souffle",
          // description: description,
          image: "assets/jutsus/wind/mega_breath.jpg",
          ninjutsuMinimum: 30,
          malus: 0,
          chakraCost: 10,
        );
}

class Rasengan extends Jutsu {
  Rasengan()
      : super(
          name: "Rasengan",
          // description: description,
          image: "assets/jutsus/wind/rasengan.jpg",
          ninjutsuMinimum: 55,
          malus: 10,
          chakraCost: 15,
        );
}

class RazorBlades extends Jutsu {
  RazorBlades()
      : super(
          name: "Lames Rasoir",
          // description: description,
          image: "assets/jutsus/wind/razor_blades.jpg",
          ninjutsuMinimum: 40,
          malus: 5,
          chakraCost: 15,
        );
}

class Tornado extends Jutsu {
  Tornado()
      : super(
          name: "Tornade",
          // description: description,
          image: "assets/jutsus/wind/tornado.jpg",
          ninjutsuMinimum: 70,
          malus: 15,
          chakraCost: 25,
        );
}

class WindBlade extends Jutsu {
  WindBlade()
      : super(
          name: "Arme du Vent",
          // description: description,
          image: "assets/jutsus/wind/wind_blade.jpg",
          ninjutsuMinimum: 25,
          malus: 0,
          chakraCost: 10,
        );
}
