import 'package:caracapp/utils/assets.dart';

import '../../models/kekkai_model.dart';

class Hyoton extends Kekkai {
  Hyoton()
      : super(
            name: "Hyoton",
            description:
                "Permet de créer et manipuler de la glace, lui donnant diverses formes variées",
            image: MyImages().imagePath[image.hyotonIcon]!,
            code: 8);
}
