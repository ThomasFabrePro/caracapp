import 'package:caracapp/classes/justsus/doton_jutsus.dart';
import 'package:caracapp/classes/justsus/futon_jutsus.dart';
import 'package:caracapp/classes/justsus/katon_jutsus.dart';
import 'package:caracapp/classes/justsus/raiton_jutsus.dart';
import 'package:caracapp/classes/justsus/suiton_jutsus.dart';
import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/models/primary_element_model.dart';

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
        );
}

class Raiton extends PrimaryElement {
  Raiton()
      : super(
          name: "Raiton",
          description: "",
          image: "assets/elements/icons/raiton_icon.png",
          jutsus: <Jutsu>[
            ThunderAbsorption(),
            ThunderWeapon(),
            FatalThunder(),
            SuperSpeed(),
            Shidori(),
            Electrocution(),
          ],
        );
}

class Doton extends PrimaryElement {
  Doton()
      : super(
          name: "Doton",
          description: "",
          image: "assets/elements/icons/doton_icon.png",
          jutsus: <Jutsu>[
            RockGolem(),
            RockWall(),
            RockJavelin(),
            Dome(),
            MultiRockClones(),
            MudTermiteMound(),
          ],
        );
}
