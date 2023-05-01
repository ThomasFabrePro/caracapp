import 'package:caracapp/models/attribute_model.dart';

class Jinchuriki extends Attribute {
  Jinchuriki()
      : super(
          name: "Jinchuriki",
          description:
              "Une fois à 20% des Hp : Reserve chakra grandement augmenté, peut envoyer 2 ninjutsu par tour, "
              "possibilité de perdre le controle à chaque tour (ex : lancé de dés raté = attaque un allié) ",
          image: "assets/attributes/jinchuriki.png",
          code: 1,
        );
}

class Shraringan extends Attribute {
  Shraringan()
      : super(
          name: "Shraringan",
          description:
              "A activer quand on le souhaite, peut être désactivé n'importe quand mais pas réactivé derriere. "
              "BONUS Ninjutsu notamment ceux pas de son type, BONUS Esquive. "
              "BONUS Genjutsu, MALUS Chakra (sorts coutent plus), MALUS Constitution",
          image: "assets/attributes/sharingan.png",
          code: 2,
        );
}

class Byakugan extends Attribute {
  Byakugan()
      : super(
          name: "Byakugan",
          description:
              "Active/désactive pareil que sharringan, BONUS Taïjutsu, BONUS Perception, MALUS Chakra, "
              "MALUS Taïjutsu après 3/4/5 tours (à voir)",
          image: "assets/attributes/byakugan.png",
          code: 3,
        );
}
