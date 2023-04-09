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
  int attribute;
  int speciality;
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
    this.speciality=0,
    this.level=1,
    this.attribute = 0,
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
  

  //buffer : Map<String, dynamic> 

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
  Future<void> setPicture(String newPicture)async{
    picture = newPicture;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  ///ATTRIBUT
  ///0 : Aucun /
  ///1 : jinchuriki /
  ///2 : Sharingan /
  ///3 : Byakugan /
  Future<void> setAttribute(int newAttribute)async{
    //Comparaison de l'ancien attribut et du nouveau
    //Si l'ancien attribut est différent de 0 on enleve les valeurs de l'ancien attribut
    //Si le nouvel attribut est différent de 0 on ajoute les valeurs du nouveau attribut
    //soustraction
    if(attribute != 0){
      switch(attribute){
        case 1:
        //pas de boost de stat pour le jinchuriki
          break;
        case 2:
        //sharingan
          ninjutsu -= 5;
          dodge -= 5;
          genjutsu -= 5;
          chakra +=5;
          constitution += 5;
          break;
        case 3:
        //byakugan
          taijutsu -= 5;
          perception -= 5;
          chakra += 5;
          break;
      }
    }
    //addition
    if(newAttribute != 0){
      switch(newAttribute){
        case 1:
        //pas de boost de stat pour le jinchuriki
          break;
        case 2:
        //sharingan
          ninjutsu += 5;
          dodge += 5;
          genjutsu += 5;
          chakra -=5;
          constitution -= 5;
          break;
        case 3:
        //byakugan
          taijutsu += 5;
          perception += 5;
          chakra -= 5;
          break;
      }
    }
    attribute = newAttribute;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  ///SPECIALITE
  ///0 : Aucun /
  ///1 : Taïjutsu /
  ///2 : Ninjutsu-chakra ? /
  ///3 : Genjutsu /
  ///4 : Lancer /
  ///5 : Chakra /
  ///6 : Invocation /
  ///7 : Sceaux /
  Future<void> setSpeciality(int newSpeciality)async{
    speciality = newSpeciality;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
}



