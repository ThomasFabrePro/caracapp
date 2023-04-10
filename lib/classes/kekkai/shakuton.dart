import 'package:caracapp/utils/assets.dart';

import '../../models/kekkais/kekkai_model.dart';

class Shakuton extends Kekkai {
  Shakuton()
      : super(
            name: "Shakuton",
            description:
                "Créé une chaleur intense capable d'augmenter la température corporelle d'un ennemi, au point que l'eau stockée dans son organisme finit par s'évaporer, tuant la victime et laissant le corps dans un état desséché.",
            image: MyImages().imagePath[image.shakutonIcon]!,
            code: 3);
}
