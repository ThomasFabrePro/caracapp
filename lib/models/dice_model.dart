import 'package:caracapp/classes/attributes.dart';

class Dice {
  final int number;
  final bool isValid;
  final int value;
  final int? rollValue;

  Dice({
    this.number = 0,
    this.value = 0,
    this.rollValue,
    this.isValid = false,
  });
}
