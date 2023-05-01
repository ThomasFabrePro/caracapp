import 'package:caracapp/classes/attributes.dart';
import 'package:caracapp/models/jutsu_model.dart';

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

  // Attribute getAttribute(int code) {
  //   switch (code) {
  //     case 1:
  //       return Jinchuriki();
  //     case 2:
  //       return Shraringan();
  //     case 3:
  //       return Byakugan();
  //     default:
  //       return Attribute();
  //   }
  // }
}
