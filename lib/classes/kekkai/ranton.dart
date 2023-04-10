import 'package:caracapp/utils/assets.dart';

import '../../models/kekkais/kekkai_model.dart';

class Ranton extends Kekkai {
  Ranton()
      : super(
            name: "Ranton",
            description:
                "Permet de créer des faisceaux d'énergie pouvant être dirigés vers l'ennemi.",
            image: MyImages().imagePath[image.rantonIcon]!,
            code: 5);
}
