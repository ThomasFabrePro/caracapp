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

class Kekkai {
  final String name;
  final String description;
  final String image;
  final int code;

  Kekkai({
    this.name = "nope",
    this.description = "nope",
    this.image = "nope",
    this.code = 1,
  });

  Kekkai getKekkai(int code) {
    switch (code) {
      case 1:
        return Enton();
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
