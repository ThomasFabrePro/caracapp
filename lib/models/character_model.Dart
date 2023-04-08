// entity/person.dart

import 'package:floor/floor.dart';
import 'package:caracapp/database/db_helper.dart';


@entity
class Character {
  @primaryKey
  final int id;

  String name;
  String picture;
  String sexe;
  int age;
  String origin;
  int level;
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
    this.sexe = "Non Binaire",
    this.age = 17,
    this.origin = "Konoha",
    this.level=1,
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
  Future<void> setLevel(int newLevel)async {
    level = newLevel;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  Future<void> setHp(int newHp)async {
    hp = newHp;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  Future<void> setConstitution(int newConstitution)async {
    constitution = newConstitution;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  Future<void> setNinjutsu(int newNinjutsu)async {
    ninjutsu = newNinjutsu;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  Future<void> setTaijutsu(int newTaijutsu)async {
    taijutsu = newTaijutsu;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  Future<void> setGenjutsu(int newGenjutsu)async {
    genjutsu = newGenjutsu;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  Future<void> setLuck(int newLuck)async {
    luck = newLuck;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  Future<void> setPerception(int newPerception)async {
    perception = newPerception;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  Future<void> setChakra(int newChakra)async {
    chakra = newChakra;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  Future<void> setDodge(int newDodge)async {
    dodge = newDodge;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  Future<void> setThrowing(int newThrowing)async {
    throwing = newThrowing;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  Future<void> setAge(int newAge)async {
    age = newAge;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  Future<void> setOrigin(String newOrigin)async {
    origin = newOrigin;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  Future<void> setSexe(String newSexe)async {
    sexe = newSexe;
    await DbHelper.database.characterDao.updateCharacter(this);
  }

  void setPicture(String newPicture){
    picture = newPicture;
  }
}
