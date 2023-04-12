import 'package:caracapp/classes/justsus/bakuton_jutsus.dart';
import 'package:caracapp/classes/justsus/futton_jutsus.dart';
import 'package:caracapp/classes/justsus/hyoton_jutsus.dart';
import 'package:caracapp/classes/justsus/jinton_jutsus.dart';
import 'package:caracapp/classes/justsus/jiton_jutsus.dart';
import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/utils/assets.dart';

import '../../models/kekkai_model.dart';

class Koton extends Kekkai {
  Koton()
      : super(
          name: "Koton",
          description: "Manipulation du métal",
          image: "assets/elements/icons/koton_icon.png",
          jutsus: <Jutsu>[],
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
            image: MyImages().imagePath[image.shakutonIcon]!,
            code: 3);
}

class Yoton extends Kekkai {
  Yoton()
      : super(
          name: "Yôton",
          description:
              "Cette affinité permet à son utilisateur de cracher de la lave sous différentes formes.",
          image: MyImages().imagePath[image.yotonIcon]!,
          code: 4,
        );
}

class Ranton extends Kekkai {
  Ranton()
      : super(
            name: "Ranton",
            description:
                "Permet de créer des faisceaux d'énergie pouvant être dirigés vers l'ennemi.",
            image: MyImages().imagePath[image.rantonIcon]!,
            code: 5);
}

class Jinton extends Kekkai {
  Jinton()
      : super(
            name: "Jinton",
            description:
                "Permet d'utiliser des mouvements à une vitesse pratiquement instantanée, donnant à l'utilisateur un avantage face aux adversaires ayant plus de force que de vitesse.",
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
            ],
            code: 8);
}

class Mokuton extends Kekkai {
  Mokuton()
      : super(
            name: "Mokuton",
            description:
                " Il fut utilisé par Hashirama Senju et aucune personne autre que lui n’est connue pour avoir maîtrisé le Mokuton naturellement.\nElément puissant et polyvalent.",
            image: MyImages().imagePath[image.mokutonIcon]!,
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
