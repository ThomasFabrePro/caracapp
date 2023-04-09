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
  //buffers
  int hpBuffer;
  int constitutionBuffer;
  int ninjutsuBuffer;
  int taijutsuBuffer;
  int genjutsuBuffer;
  int luckBuffer;
  int perceptionBuffer;
  int chakraBuffer;
  int dodgeBuffer;
  int throwingBuffer;

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
    //buffers
    this.hpBuffer=0,
    this.constitutionBuffer=0,
    this.ninjutsuBuffer=0,
    this.taijutsuBuffer=0,
    this.genjutsuBuffer=0,
    this.luckBuffer=0,
    this.perceptionBuffer=0,
    this.chakraBuffer=0,
    this.dodgeBuffer=0,
    this.throwingBuffer=0,
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
          ninjutsuBuffer -= 5;
          dodgeBuffer -= 5;
          genjutsuBuffer -= 5;
          chakraBuffer +=5;
          constitutionBuffer += 5;
          break;
        case 3:
        //byakugan
          taijutsuBuffer -= 5;
          perceptionBuffer -= 5;
          chakraBuffer += 5;
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
          ninjutsuBuffer += 5;
          dodgeBuffer += 5;
          genjutsuBuffer += 5;
          chakraBuffer -=5;
          constitutionBuffer -= 5;
          break;
        case 3:
        //byakugan
          taijutsuBuffer += 5;
          perceptionBuffer += 5;
          chakraBuffer -= 5;
          break;
      }
    }
    attribute = newAttribute;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
  ///STATCODES
  ///0 : Aucun /
  ///1 : HPBuffer /
  ///2 : ConstitutionBuffer /
  ///3 : NinjutsuBuffer /
  ///4 : TaijutsuBuffer /
  ///5 : GenjutsuBuffer /
  ///6 : LuckBuffer /
  ///7 : PerceptionBuffer /
  ///8 : ChakraBuffer /
  ///9 : DodgeBuffer /
  ///10 : ThrowingBuffer /
  // Future<void> addToBuffer(int statCode,int newBuffer)async{
  //   switch(statCode){
  //     case 1:
  //       hpBuffer += newBuffer;
  //       break;
  //     case 2:
  //       constitutionBuffer += newBuffer;
  //       break;
  //     case 3:
  //       ninjutsuBuffer += newBuffer;
  //       break;
  //     case 4:
  //       taijutsuBuffer += newBuffer;
  //       break;
  //     case 5:
  //       genjutsuBuffer += newBuffer;
  //       break;
  //     case 6:
  //       luckBuffer += newBuffer;
  //       break;
  //     case 7:
  //       perceptionBuffer += newBuffer;
  //       break;
  //     case 8:
  //       chakraBuffer += newBuffer;
  //       break;
  //     case 9:
  //       dodgeBuffer += newBuffer;
  //       break;
  //     case 10:
  //       throwingBuffer += newBuffer;
  //       break;
  //   }
  //   await DbHelper.database.characterDao.updateCharacter(this);
  // }
  ///SPECIALITE
  ///0 : Aucun /
  ///1 : Taïjutsu /
  ///2 : Ninjutsu-chakra ? /
  ///3 : Genjutsu /
  ///4 : Lancer /
  ///5 : Chakra /
  ///6 : Chance /
  ///7 : Dodge /
  Future<void> setSpeciality(int newSpeciality)async{
    switch(speciality){
      case 0:
        break;
      case 1:
        taijutsuBuffer -= 5;
        break;
      case 2:
        ninjutsuBuffer -= 5;
        break;
      case 3:
        genjutsuBuffer -= 5;
        break;
      case 4:
        throwingBuffer -= 5;
        break;
      case 5:
        chakraBuffer -= 5;
        break;
      case 6:
        luckBuffer -= 5;
        break;
      case 7:
        dodgeBuffer -= 5;
        break;
    }
    switch(newSpeciality){
      case 0:
        break;
      case 1:
        taijutsuBuffer += 5;
        break;
      case 2:
        ninjutsuBuffer += 5;
        break;
      case 3:
        genjutsuBuffer += 5;
        break;
      case 4:
        throwingBuffer += 5;
        break;
      case 5:
        chakraBuffer += 5;
        break;
      case 6:
        luckBuffer += 5;
        break;
      case 7:
        dodgeBuffer += 5;
        break;
    }
    speciality = newSpeciality;
    await DbHelper.database.characterDao.updateCharacter(this);
  }
}



