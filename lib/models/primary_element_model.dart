// ignore_for_file: annotate_overrides, overridden_fields

import 'package:caracapp/classes/elements.dart';
import 'package:caracapp/models/element_model.dart';
import 'package:caracapp/models/jutsu_model.dart';

class PrimaryElement extends NatureElement {
  String name;
  String description;
  String image;
  int code;
  List<Jutsu> jutsus;
  PrimaryElement({
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
  PrimaryElement getElement(int code) {
    switch (code) {
      case 1:
        return Katon();
      case 2:
        return Raiton();
      case 3:
        return Suiton();
      case 4:
        return Futon();
      case 5:
        return Doton();
      default:
        return PrimaryElement();
    }
  }
}
