// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';

class IcePic extends Jutsu {
  IcePic()
      : super(
          name: "Pic de Glace",
          description: "Envoie un pic de glace",
          image: "assets/jutsus/hyoton/ice_pic.jpg",
          ninjutsuMinimum: 45,
          malus: 0,
          chakraCost: 10,
        );
}

class IceSwallow extends Jutsu {
  IceSwallow()
      : super(
          name: "Volée d'Hirondelles",
          description:
              "Envoie une volée d'hirondelles qui explosent en envoyant une multitude d'aiguilles de glace",
          image: "assets/jutsus/hyoton/ice_swallow.jpg",
          ninjutsuMinimum: 55,
          malus: 4,
          chakraCost: 15,
        );
}

class IceWall extends Jutsu {
  IceWall()
      : super(
          name: "Mur de Glace",
          description:
              "Fait apparaitre un mur de glace très résistant devant vous",
          image: "assets/jutsus/hyoton/ice_wall.jpg",
          ninjutsuMinimum: 40,
          malus: 2,
          chakraCost: 10,
        );
}

class IceWolf extends Jutsu {
  IceWolf()
      : super(
          name: "Invocation de Loup",
          description: "Invoque un gros loup de glace",
          image: "assets/jutsus/hyoton/wolf_invocation.jpg",
          ninjutsuMinimum: 65,
          malus: 4,
          chakraCost: 20,
        );
}
