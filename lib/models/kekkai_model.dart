// ignore_for_file: annotate_overrides, overridden_fields

import 'package:caracapp/classes/kekkais.dart';
import 'package:caracapp/models/element_model.dart';
import 'package:caracapp/models/jutsu_model.dart';

class Kekkai extends NatureElement {
  String name;
  String description;
  String image;
  int code;
  List<Jutsu> jutsus;
  Kekkai({
    this.name = "",
    this.description = "",
    this.image = "",
    this.code = 0,
    this.jutsus = const <Jutsu>[],
  }) : super(
          name: name,
          description: description,
          image: image,
          code: code,
          jutsus: jutsus,
        );
  Kekkai getElement(int code) {
    switch (code) {
      case 1:
        return Koton();
      case 2:
        return Futton();
      case 3:
        return Shakuton();
      case 4:
        return Yoton();
      case 5:
        return Ranton();
      case 6:
        return Jinton();
      case 7:
        return Bakuton();
      case 8:
        return Hyoton();
      case 9:
        return Mokuton();
      case 10:
        return Jiton();
      default:
        return Kekkai();
    }
  }
}
