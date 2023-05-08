import 'package:caracapp/classes/justsus/bakuton_jutsus.dart';
import 'package:caracapp/classes/justsus/futton_jutsus.dart';
import 'package:caracapp/classes/justsus/hyoton_jutsus.dart';
import 'package:caracapp/classes/justsus/jinton_jutsus.dart';
import 'package:caracapp/classes/justsus/jiton_jutsus.dart';
import 'package:caracapp/classes/justsus/koton_jutsus.dart';
import 'package:caracapp/classes/justsus/mokuton_jutsus.dart';
import 'package:caracapp/classes/justsus/ranton_jutsus.dart';
import 'package:caracapp/classes/justsus/shakuton_jutsus.dart';
import 'package:caracapp/classes/justsus/yoton_jutsus.dart';
import 'package:caracapp/models/jutsu_model.dart';

import '../../models/kekkai_model.dart';

class Koton extends Kekkai {
  Koton()
      : super(
          name: "Koton",
          description: "Manipulation du métal",
          image: "assets/elements/icons/koton_icon.png",
          jutsus: <Jutsu>[
            StealAffinity(),
            StealProduction(),
            StealSkin(),
            Bullet(),
          ],
          code: 1,
        );
}

class Futton extends Kekkai {
  Futton()
      : super(
            name: "Futton",
            description:
                "Libération d'Ébullition. Utilisation de la vapeur, notamment la vapeur acide. (Exemple Kage Meï Terumi)",
            image: "assets/elements/icons/futton_icon.png",
            jutsus: <Jutsu>[
              AcidSmoke(),
              ExplosiveMyst(),
              HellSauna(),
            ],
            code: 2);
}

class Shakuton extends Kekkai {
  Shakuton()
      : super(
            name: "Shakuton",
            description:
                "Créé une chaleur intense capable d'augmenter la température corporelle d'un ennemi, au point que l'eau stockée dans son organisme finit par s'évaporer, tuant la victime et laissant le corps dans un état desséché.",
            image: "assets/elements/icons/shakuton_icon.png",
            jutsus: <Jutsu>[
              DryOut(),
              ExplosiveGasBall(),
              ProtectiveBalls(),
              FireAbsorption(),
            ],
            code: 3);
}

class Yoton extends Kekkai {
  Yoton()
      : super(
          name: "Yôton",
          description:
              "Cette affinité permet à son utilisateur de cracher de la lave sous différentes formes.",
          image: "assets/elements/icons/yoton_icon.png",
          jutsus: <Jutsu>[
            ExplosiveLava(),
            Ignite(),
            LavaTorrent(),
            Cataclysm(),
          ],
          code: 4,
        );
}

class Ranton extends Kekkai {
  Ranton()
      : super(
            name: "Ranton",
            description:
                "Permet de créer des faisceaux d'énergie noire dont la puissance est décuplée",
            image: "assets/elements/icons/ranton_icon.png",
            jutsus: <Jutsu>[
              LaserSurge(),
              GuidedLasers(),
              ThunderPanther(),
              BlackThunder(),
            ],
            code: 5);
}

class Jinton extends Kekkai {
  Jinton()
      : super(
            name: "Jinton",
            description:
                "Permet une maîtrise de la poussière au point de pouvoir créer du vide",
            image: "assets/elements/icons/jinton_icon.png",
            jutsus: <Jutsu>[
              MagicCube(),
              ProtectiveDust(),
              VoidNiddle(),
            ],
            code: 6);
}

class Bakuton extends Kekkai {
  Bakuton()
      : super(
            name: "Bakuton",
            description:
                "Elle permet à l'utilisateur de transformer son chakra en puissance explosive, qu'il peut manier ensuite comme bon lui semble. (Exemple Deidara)",
            image: "assets/elements/icons/bakuton_icon.png",
            jutsus: <Jutsu>[
              ExplosiveHands(),
              Explosion(),
              Scolopandre(),
              BigBird(),
            ],
            code: 7);
}

class Hyoton extends Kekkai {
  Hyoton()
      : super(
            name: "Hyoton",
            description:
                "Permet de créer et manipuler de la glace, lui donnant diverses formes variées",
            image: "assets/elements/icons/hyoton_icon.png",
            jutsus: <Jutsu>[
              IceWall(),
              IcePic(),
              IceSwallow(),
              IceWolf(),
            ],
            code: 8);
}

class Mokuton extends Kekkai {
  Mokuton()
      : super(
            name: "Mokuton",
            description:
                " Il fut utilisé par Hashirama Senju et aucune personne autre que lui n’est connue pour avoir maîtrisé le Mokuton naturellement.\nElément puissant et polyvalent.",
            image: "assets/elements/icons/mokuton_icon.png",
            jutsus: <Jutsu>[
              Hindrance(),
              // WoodenGolem(),
              Arena(),
              GreatGrowth(),
            ],
            code: 9);
}

class Jiton extends Kekkai {
  Jiton()
      : super(
            name: "Jiton",
            description:
                "Libération de Magnétisme\nLes utilisateurs du Jiton génèrent un champ magnétique qu'ils appliquent sur diverses substances afin de les utiliser dans différentes situations.",
            image: "assets/elements/icons/jiton_icon.png",
            jutsus: <Jutsu>[
              Repulsion(),
              Attraction(),
              FlyingSticks(),
              Destruction(),
            ],
            code: 10);
}
