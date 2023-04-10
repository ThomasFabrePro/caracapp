import 'package:caracapp/utils/assets.dart';

import '../../models/kekkais/kekkai_model.dart';

class Yoton extends Kekkai {
  Yoton()
      : super(
            name: "Yôton",
            description:
                "Cette affinité permet à son utilisateur de cracher de la lave sous différentes formes.",
            image: MyImages().imagePath[image.yotonIcon]!,
            code: 4);
}
