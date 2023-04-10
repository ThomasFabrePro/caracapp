import 'package:caracapp/utils/assets.dart';

import '../../models/kekkai_model.dart';

class Jinton extends Kekkai {
  Jinton()
      : super(
            name: "Jinton",
            description:
                "Permet d'utiliser des mouvements à une vitesse pratiquement instantanée, donnant à l'utilisateur un avantage face aux adversaires ayant plus de force que de vitesse.",
            image: MyImages().imagePath[image.jintonIcon]!, //TODO
            code: 6); //TODO
}
