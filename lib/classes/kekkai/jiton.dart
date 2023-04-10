import 'package:caracapp/utils/assets.dart';

import '../../models/kekkais/kekkai_model.dart';

class Jiton extends Kekkai {
  Jiton()
      : super(
            name: "Jiton",
            description:
                "Libération de Magnétisme\nLes utilisateurs du Jiton génèrent un champ magnétique qu'ils appliquent sur diverses substances afin de les utiliser dans différentes situations.",
            image: MyImages().imagePath[image.jitonIcon]!,
            code: 10);
}
