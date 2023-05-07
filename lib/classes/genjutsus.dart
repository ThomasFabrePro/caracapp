import 'package:caracapp/classes/justsus/genjutsu_jutsus.dart';
import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/models/primary_element_model.dart';

class Genjutsu extends PrimaryElement {
  Genjutsu()
      : super(
          name: "Genjutsu",
          description: "Techniques d'illusion",
          image: "assets/elements/icons/genjutsu_icon.png",
          jutsus: <Jutsu>[
            Trance(),
            Terror(),
            Permutation(),
            Execution(),
            Vanish(),
            DivineOrder(),
          ],
        );
}
