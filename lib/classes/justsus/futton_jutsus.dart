// ignore_for_file: overridden_fields, annotate_overrides

import 'package:caracapp/models/jutsu_model.dart';

class AcidSmoke extends Jutsu {
  AcidSmoke()
      : super(
          name: "Fumée acide",
          description: "Envoie une fumée acide sur la cible",
          image: "assets/jutsus/futton/acid_smoke.jpg",
          ninjutsuMinimum: 45,
          malus: 2,
          chakraCost: 10,
        );
}

class ExplosiveMyst extends Jutsu {
  ExplosiveMyst()
      : super(
          name: "Brume en Ebullition",
          description:
              "Envoie une vague de vapeur qui brule tout ce qu'elle touche",
          image: "assets/jutsus/futton/explosive_myst.jpg",
          ninjutsuMinimum: 55,
          malus: 4,
          chakraCost: 15,
        );
}

class HellSauna extends Jutsu {
  HellSauna()
      : super(
          name: "Sauna Infernal",
          description: "Créé une zone de chaleur infernale tout autour de vous",
          image: "assets/jutsus/futton/sauna.jpg",
          ninjutsuMinimum: 65,
          malus: 4,
          chakraCost: 25,
        );
}
