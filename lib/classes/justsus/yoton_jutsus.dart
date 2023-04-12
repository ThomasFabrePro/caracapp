// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';

class Cataclysm extends Jutsu {
  Cataclysm()
      : super(
          name: "Cataclysme",
          description:
              "Vous explosez comme un volcan et faites déferler lave et cendre tout autour de vous",
          image: "assets/jutsus/yoton/cataclysm.jpg",
          ninjutsuMinimum: 80,
          malus: 20,
          chakraCost: 30,
        );
}

class ExplosiveLava extends Jutsu {
  ExplosiveLava()
      : super(
          name: "Boule de lave",
          description: "Crache une boule de lave",
          image: "assets/jutsus/yoton/lava_ball.jpg",
          ninjutsuMinimum: 60,
          malus: 15,
          chakraCost: 15,
        );
}

class Ignite extends Jutsu {
  Ignite()
      : super(
          name: "Embrasement",
          description: "Vous immunise au feu et vous enveloppe de flammes",
          image: "assets/jutsus/yoton/ignite.jpg",
          ninjutsuMinimum: 45,
          malus: 0,
          chakraCost: 15,
        );
}

class LavaTorrent extends Jutsu {
  LavaTorrent()
      : super(
          name: "Vague de Lave",
          description: "Projète une vague de lave devant vous",
          image: "assets/jutsus/yoton/lava_torrent.jpg",
          ninjutsuMinimum: 60,
          malus: 10,
          chakraCost: 15,
        );
}
