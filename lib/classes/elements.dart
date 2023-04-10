import 'package:caracapp/classes/justsus/katon_jutsus.dart';
import 'package:caracapp/classes/justsus/suiton_jutsus.dart';
import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/models/primary_element_model.dart';
import 'package:caracapp/utils/assets.dart';

class Katon extends PrimaryElement {
  Katon()
      : super(
          name: "Katon",
          description: "",
          image: MyImages().imagePath[image.katonIcon]!,
          jutsus: <Jutsu>[
            FireBall(),
            AshCloud(),
            BreathOfFire(),
            SmallFireBalls(),
            FlameBurst(),
            FireDragon(),
          ],
          // code: 1,
        );
}

class Suiton extends PrimaryElement {
  Suiton()
      : super(
          name: "Suiton",
          description: "",
          image: MyImages().imagePath[image.waterIcon]!,
          jutsus: <Jutsu>[
            WaterDragon(),
            WaterSword(),
            WaterClone(),
            WaterPrison(),
            Tsunami(),
            WaterRelease(),
          ],
          // code: 1,
        );
}

class Futon extends PrimaryElement {
  Futon()
      : super(
          name: "Futon",
          description: "",
          image: "",
          jutsus: <Jutsu>[],
          // code: 1,
        );
}

class Raiton extends PrimaryElement {
  Raiton()
      : super(
          name: "Raiton",
          description: "",
          image: "",
          jutsus: <Jutsu>[],
          // code: 1,
        );
}

class Doton extends PrimaryElement {
  Doton()
      : super(
          name: "Doton",
          description: "",
          image: "",
          jutsus: <Jutsu>[],
          // code: 1,
        );
}
