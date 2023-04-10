import 'package:caracapp/utils/assets.dart';

import '../../models/kekkais/kekkai_model.dart';

class Enton extends Kekkai {
  Enton()
      : super(
          name: "Enton",
          description:
              "Lié à l'usage de l'arcane Amaterasu du mangekyō sharingan de Sasuke et Itachi Uchiwa.Le feu noir crée par la nature.",
          image: MyImages().imagePath[image.entonIcon]!,
          code: 1,
        );
}
