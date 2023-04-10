import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/utils/assets.dart';

class GokakyuNoJutsu extends Jutsu {
  GokakyuNoJutsu()
      : super(
          name: "Gokakyu no Jutsu",
          description: "Boule de feu",
          image: MyImages().imagePath[image.katonJutsu1]!,
          ninjutsuMinimum: 50,
          malus: 5,
        );
}
