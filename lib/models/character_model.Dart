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
  int mainSpe;
  int secondSpe;
  int mainElement;
  int secondElement;
  int kekkaiGenkai;
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
    this.mainSpe=0,
    this.secondSpe=0,
    this.mainElement=0,
    this.secondElement=0,
    this.kekkaiGenkai=0,
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
  Map<String, int> kekkaisMap={
      "[1, 2]": 1,  //Enton
      "[1, 3]": 2,  //Futton
      "[1, 4]": 3,  //Shakuton
      "[1, 5]": 4,  //Yoton
      "[2, 3]": 5,  //Ranton
      "[2, 4]": 6,  //Jinton
      "[2, 5]": 7,  //Bakuton
      "[3, 4]": 8,  //Hyoton
      "[3, 5]": 9,  //Mokuton
      "[4, 5]": 10, //Jiton
  };

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
  

  Future<void> setSpeciality(int newSpeciality, {required bool add})async{
    int noSpe = 0;
    if(add){
        if (mainSpe == noSpe) {
          setBuffers(mainSpe, newSpeciality);
          mainSpe = newSpeciality;
        } else if (secondSpe == noSpe) {
          setBuffers(secondSpe, newSpeciality);
          secondSpe = newSpeciality;
        }
    }else{
      if(mainSpe == newSpeciality){
        setBuffers(mainSpe, noSpe);
        mainSpe = noSpe;
      }else if(secondSpe == newSpeciality){
        setBuffers(secondSpe, noSpe);
        secondSpe = noSpe;
      }
    }
    await DbHelper.database.characterDao.updateCharacter(this);

  }
  ///SPECIALITE
  ///0 : Aucun /
  ///1 : Taïjutsu /
  ///2 : Ninjutsu-chakra ? /
  ///3 : Genjutsu /
  ///4 : Lancer /
  ///5 : Chakra /
  ///6 : Chance /
  ///7 : Dodge /
  // Future<void> updateSpeciality(int newSpeciality)async{
  //   setBuffers(mainSpe, newSpeciality);
  //   mainSpe = newSpeciality;
  //   await DbHelper.database.characterDao.updateCharacter(this);
  // }

  // Future<void> updateSecondSpeciality(int newSpeciality)async{
  //   setBuffers(secondSpe, newSpeciality);
  //   secondSpe = newSpeciality;
  //   await DbHelper.database.characterDao.updateCharacter(this);
  // }

  void setBuffers(int currentSpeciality,int chosenSpeciality){
    switch(currentSpeciality){
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

      switch(chosenSpeciality){
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
  }
  ///ELEMENT
  ///0 : Aucun /
  ///1 : Feu /
  ///2 : Foudre /
  ///3 : Eau /
  ///4 : Vent /
  ///5 : Terre /
  Future<void> setElement(int newElement, {required bool add})async{
      if(add){
        if (mainElement == 0) {
          mainElement = newElement;
        } else if (secondElement == 0) {
          secondElement = newElement;
        }
      }else{
        if(mainElement == newElement){
          mainElement = 0;
        }else if(secondElement == newElement){
          secondElement = 0;
        }
      }
    setKekkaiGenkai();
    await DbHelper.database.characterDao.updateCharacter(this);
  }

void setKekkaiGenkai() {
    if(mainElement !=0 && secondElement != 0){
      List<int> characterElements = [mainElement,secondElement];
      characterElements.sort();
      String index = characterElements.toString();
      kekkaiGenkai = kekkaisMap[index] ?? 0;
    }else{
      kekkaiGenkai= 0;
    }
  }
}



