import 'package:caracapp/classes/justsus/katon_jutsus.dart';
import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/models/primary_element_model.dart';
import 'package:caracapp/utils/assets.dart';

class Katon extends PrimaryElement {
  Katon()
      : super(
          name: "Katon",
          description: "",
          image: "",
          jutsus: <Jutsu>[GokakyuNoJutsu()],
          // code: 1,
        );
}

class Suiton extends PrimaryElement {
  Suiton()
      : super(
          name: "Suiton",
          description: "",
          image: "",
          jutsus: <Jutsu>[],
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
