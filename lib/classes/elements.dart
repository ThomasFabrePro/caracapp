import 'package:caracapp/classes/justsus/doton_jutsus.dart';
import 'package:caracapp/classes/justsus/futon_jutsus.dart';
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
          image: "assets/elements/icons/katon_icon.png",
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
          image: "assets/elements/icons/suiton_icon.png",
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
          image: "assets/elements/icons/futon_icon.png",
          jutsus: <Jutsu>[
            WindDragon(),
            MegaBreath(),
            Rasengan(),
            WindBlade(),
            RazorBlades(),
            Tornado(),
          ],
          // code: 1,
        );
}

class Raiton extends PrimaryElement {
  Raiton()
      : super(
          name: "Raiton",
          description: "",
          image: "assets/elements/icons/raiton_icon.png",
          jutsus: <Jutsu>[],
          // code: 1,
        );
}

class Doton extends PrimaryElement {
  Doton()
      : super(
          name: "Doton",
          description: "assets/elements/icons/doton_icon.png",
          image: "",
          jutsus: <Jutsu>[
            RockGolem(),
            RockWall(),
            RockJavelin(),
            Dome(),
            MultiRockClones(),
            MudTermiteMound(),
          ],
          // code: 1,
        );
}
