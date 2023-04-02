// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Character {
  @primaryKey
  final int id;

  String name;

  Character(
    this.id, 
    this.name);

  void setName(String newName){
    name = newName;
  }
}