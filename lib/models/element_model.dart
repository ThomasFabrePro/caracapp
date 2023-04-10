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
import 'package:caracapp/models/jutsu_model.dart';

///Code
/// 0 : None /
/// 1 : Hyoton /
/// 2 :Futton
///

class Element {
  final String name;
  final String description;
  final String image;
  final int code;
  final List<Jutsu> jutsus;

  Element({
    this.name = "nope",
    this.description = "nope",
    this.image = "nope",
    this.code = 1,
    this.jutsus = const <Jutsu>[],
  });
}
