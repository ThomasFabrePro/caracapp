import 'package:caracapp/models/attribute_model.dart';

class Jinchuriki extends Attribute {
  Jinchuriki()
      : super(
          name: "Jinchuriki",
          description: "Passif\n"
              "Une fois à 20% des Hp : Chakra grandement augmenté, peut envoyer 2 ninjutsu par tour.\n"
              "Possibilité de perdre le controle à chaque tour (ex : lancé (chance?) raté = attaque un allié)",
          image: "assets/attributes/jinchuriki.jpg",
          code: 1,
        );
}

class Sharingan extends Attribute {
  Sharingan()
      : super(
          name: "Sharingan",
          description: "Activable\n"
              "BONUS : Genjutsu, Esquive, Ninjutsu\n"
              "MALUS : Chakra, Constitution",
          image: "assets/attributes/sharingan.jpg",
          code: 2,
        );
}

class Byakugan extends Attribute {
  Byakugan()
      : super(
          name: "Byakugan",
          description: "Activable\n"
              "BONUS : Taïjutsu, Perception\n"
              "MALUS : Chakra",
          // "MALUS Taïjutsu après 3/4/5 tours (à voir)",
          image: "assets/attributes/byakugan.jpg",
          code: 3,
        );
}
