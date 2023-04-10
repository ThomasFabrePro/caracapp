import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/utils/assets.dart';

class GokakyuNoJutsu extends Jutsu {
  String name;
  String description;
  int ninjutsuMinimum;
  int malus;

  GokakyuNoJutsu({
    this.name = "Gokakyu no Jutsu",
    this.description = "Boule de feu",
    this.ninjutsuMinimum = 50,
    this.malus = 5,
  }) : super(
          name: name,
          description: "Boule de feu",
          image: MyImages().imagePath[image.katonJutsu1]!,
          ninjutsuMinimum: 50,
          malus: 5,
        );
}
