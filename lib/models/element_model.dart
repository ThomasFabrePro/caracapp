import 'package:caracapp/models/jutsu_model.dart';

class NatureElement {
  final String name;
  final String description;
  final String image;
  final int code;
  final List<Jutsu> jutsus;

  NatureElement({
    this.name = "",
    this.description = "",
    this.image = "",
    this.code = 0,
    this.jutsus = const <Jutsu>[],
  });
  NatureElement getElement(int code) {
    return NatureElement();
  }
}
