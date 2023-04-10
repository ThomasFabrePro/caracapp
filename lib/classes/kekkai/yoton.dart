import 'package:caracapp/utils/assets.dart';

import '../../models/kekkais/kekkai_model.dart';

class Yoton extends Kekkai {
  Yoton()
      : super(
            name: "Yôton",
            description:
                "Alors que la majorité des kekkei genkai sont tous identiques d'un utilisateur à l'autre, le Yôton se présente sous différentes formes selon les personnes qui l'utilisent.",
            image: MyImages().imagePath[image.yotonIcon]!,
            code: 4);
}
