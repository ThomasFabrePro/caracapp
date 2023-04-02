// entity/person.dart

import 'package:floor/floor.dart';

@entity
class Character {
  @primaryKey
  final int id;

  String name;
  String picture;

  Character(
    this.id, 
    this.name,this.picture);

  void setName(String newName){
    name = newName;
  }
  void setPicture(String newPicture){
    picture = newPicture;
  }
}