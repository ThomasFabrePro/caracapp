import 'package:caracapp/classes/attributes.dart';

class Attribute {
  final String name;
  final String description;
  final String image;
  final int code;
  // final List<Jutsu> jutsus;

  Attribute({
    this.name = "",
    this.description = "",
    this.image = "",
    this.code = 0,
    // this.jutsus = const <Jutsu>[],
  });
}
