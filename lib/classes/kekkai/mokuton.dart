import 'package:caracapp/utils/assets.dart';

import '../../models/kekkai_model.dart';

class Mokuton extends Kekkai {
  Mokuton()
      : super(
            name: "Mokuton",
            description:
                " Il fut utilisé par Hashirama Senju et aucune personne autre que lui n’est connue pour avoir maîtrisé le Mokuton naturellement.\nElément puissant et polyvalent.",
            image: MyImages().imagePath[image.mokutonIcon]!,
            code: 9);
}
