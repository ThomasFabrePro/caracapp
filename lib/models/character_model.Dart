// entity/person.dart

import 'package:floor/floor.dart';
import 'package:caracapp/database/database.dart';
import 'package:caracapp/database/db_helper.dart';


@entity
class Character {
  @primaryKey
  final int id;

  String name;
  String picture;
  int hp;
  int constitution;
  int ninjutsu;
  int taijutsu;
  int genjutsu;
  int luck;
  int perception;
  int chakra;
  int dodge;
  int throwing;

  Character(
    {
    this.id=1, 
    this.name="Patrick",
    this.picture="", 
    this.hp=30, 
    this.constitution=30,
    this.ninjutsu=30,
    this.taijutsu=30,
    this.genjutsu=30,
    this.luck=30,
    this.perception=30,
    this.chakra=30,
    this.dodge = 30,
    this.throwing=30,
         });

  Future<void> setName(String newName)async {
    
    name = newName;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  void setPicture(String newPicture){
    picture = newPicture;
  }
}