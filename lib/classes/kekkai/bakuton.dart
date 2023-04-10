import 'package:caracapp/utils/assets.dart';

import '../../models/kekkai_model.dart';

class Bakuton extends Kekkai {
  Bakuton()
      : super(
            name: "Bakuton",
            description:
                "Elle permet à l'utilisateur de transformer son chakra en puissance explosive, qu'il peut manier ensuite comme bon lui semble. (Exemple Deidara)",
            image: MyImages().imagePath[image.bakutonIcon]!,
            code: 7);
}
