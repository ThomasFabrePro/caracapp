import 'package:caracapp/utils/assets.dart';

import '../../models/kekkais/kekkai_model.dart';

class Futton extends Kekkai {
  Futton()
      : super(
            name: "Futton",
            description:
                "Libération d'Ébullition. Utilisation de la vapeur, notamment la vapeur acide. (Exemple Kage Meï Terumi)",
            image: MyImages().imagePath[image.futtonIcon]!,
            code: 2);
}
