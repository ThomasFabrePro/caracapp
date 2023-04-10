import 'package:caracapp/utils/assets.dart';

import '../../models/kekkai_model.dart';

class Enton extends Kekkai {
  Enton()
      : super(
          name: "Enton",
          description:
              "Lié à l'usage de l'arcane Amaterasu du mangekyō sharingan de Sasuke et Itachi Uchiwa. Le feu noir crée par la nature.",
          image: MyImages().imagePath[image.entonIcon]!,
          code: 1,
        );
}

class Futton extends Kekkai {
  Futton()
      : super(
            name: "Futton",
            description:
                "Libération d'Ébullition. Utilisation de la vapeur, notamment la vapeur acide. (Exemple Kage Meï Terumi)",
            image: MyImages().imagePath[image.futtonIcon]!,
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
            image: MyImages().imagePath[image.jintonIcon]!,
            code: 6);
}

class Bakuton extends Kekkai {
  Bakuton()
      : super(
            name: "Bakuton",
            description:
                "Elle permet à l'utilisateur de transformer son chakra en puissance explosive, qu'il peut manier ensuite comme bon lui semble. (Exemple Deidara)",
            image: MyImages().imagePath[image.bakutonIcon]!,
            code: 7);
}

class Hyoton extends Kekkai {
  Hyoton()
      : super(
            name: "Hyoton",
            description:
                "Permet de créer et manipuler de la glace, lui donnant diverses formes variées",
            image: MyImages().imagePath[image.hyotonIcon]!,
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
            image: MyImages().imagePath[image.jitonIcon]!,
            code: 10);
}
