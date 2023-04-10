import 'package:caracapp/classes/kekkai/bakuton.dart';
import 'package:caracapp/classes/kekkai/enton.dart';
import 'package:caracapp/classes/kekkai/futton.dart';
import 'package:caracapp/classes/kekkai/hyoton.dart';
import 'package:caracapp/classes/kekkai/jinton.dart';
import 'package:caracapp/classes/kekkai/jiton.dart';
import 'package:caracapp/classes/kekkai/mokuton.dart';
import 'package:caracapp/classes/kekkai/ranton.dart';
import 'package:caracapp/classes/kekkai/shakuton.dart';
import 'package:caracapp/classes/kekkai/yoton.dart';

///Code
/// 0 : None /
/// 1 : Hyoton /
/// 2 :Futton
///

class Jutsu {
  final String name;
  final String description;
  final String image;
  final int ninjutsuMinimum;
  final int malus;
  // final int code;

  Jutsu({
    this.name = "nope",
    this.description = "nope",
    this.image = "",
    this.ninjutsuMinimum = 50,
    this.malus = 0,
    // this.code = 1,
  });

  Jutsu getKekkai(int code) {
    switch (code) {
      // case 1:
      //   return Enton();
      // case 2:
      //   return Futton();
      // case 3:
      //   return Shakuton();
      // case 4:
      //   return Yoton();
      // case 5:
      //   return Ranton();
      // case 6:
      //   return Jinton();
      // case 7:
      //   return Bakuton();
      // case 8:
      //   return Hyoton();
      // case 9:
      //   return Mokuton();
      // case 10:
      //   return Jiton();
      default:
        return Jutsu();
    }
  }
}
