// entity/person.dart

import 'package:caracapp/classes/attributes.dart';
import 'package:caracapp/models/attribute_model.dart';
import 'package:floor/floor.dart';
import 'package:caracapp/database/db_helper.dart';

@entity
class Character {
  @primaryKey
  final int id;

  String name;
  String picture;
  String sexe;
  String origin;
  String inventory;
  String logs;
  int age;
  int level;
  int attribute;
  int attributeEnabled;
  int mainSpe;
  int secondSpe;
  int mainElement;
  int secondElement;
  int kekkaiGenkai;
  int pointsLeftToSpend;
  int hpMax;
  int hp;
  int constitution;
  int ninjutsu;
  int taijutsu;
  int genjutsu;
  int luck;
  int perception;
  int chakraMax;
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

  Character({
    this.id = 1,
    this.name = "Patrick",
    this.picture = "",
    this.sexe = "Non Binaire",
    this.age = 17,
    this.inventory = "",
    this.logs = "",
    this.origin = "Konoha",
    this.mainSpe = 0,
    this.secondSpe = 0,
    this.mainElement = 0,
    this.secondElement = 0,
    this.kekkaiGenkai = 0,
    this.level = 1,
    this.attribute = 0,
    this.attributeEnabled = 0,
    this.pointsLeftToSpend = 150,
    this.hpMax = 30,
    this.hp = 30,
    this.constitution = 30,
    this.ninjutsu = 30,
    this.taijutsu = 30,
    this.genjutsu = 30,
    this.luck = 30,
    this.perception = 30,
    this.chakraMax = 50,
    this.chakra = 50,
    this.dodge = 30,
    this.throwing = 30,
    //buffers
    this.hpBuffer = 0,
    this.constitutionBuffer = 0,
    this.ninjutsuBuffer = 0,
    this.taijutsuBuffer = 0,
    this.genjutsuBuffer = 0,
    this.luckBuffer = 0,
    this.perceptionBuffer = 0,
    this.chakraBuffer = 0,
    this.dodgeBuffer = 0,
    this.throwingBuffer = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'picture': picture,
      'sexe': sexe,
      'age': age,
      'inventory': inventory,
      'logs': logs,
      'origin': origin,
      'mainSpe': mainSpe,
      'secondSpe': secondSpe,
      'mainElement': mainElement,
      'secondElement': secondElement,
      'kekkaiGenkai': kekkaiGenkai,
      'level': level,
      'attribute': attribute,
      'attributeEnabled': attributeEnabled,
      'pointsLeftToSpend': pointsLeftToSpend,
      'hpMax': hpMax,
      'hp': hp,
      'constitution': constitution,
      'ninjutsu': ninjutsu,
      'taijutsu': taijutsu,
      'genjutsu': genjutsu,
      'luck': luck,
      'perception': perception,
      'chakraMax': chakraMax,
      'chakra': chakra,
      'dodge': dodge,
      'throwing': throwing,
      //buffers
      'hpBuffer': hpBuffer,
      'constitutionBuffer': constitutionBuffer,
      'ninjutsuBuffer': ninjutsuBuffer,
      'taijutsuBuffer': taijutsuBuffer,
      'genjutsuBuffer': genjutsuBuffer,
      'luckBuffer': luckBuffer,
      'perceptionBuffer': perceptionBuffer,
      'chakraBuffer': chakraBuffer,
      'dodgeBuffer': dodgeBuffer,
      'throwingBuffer': throwingBuffer,
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    return Character(
      id: map['id'],
      name: map['name'],
      picture: map['picture'],
      sexe: map['sexe'],
      age: map['age'],
      inventory: map['inventory'],
      logs: map['logs'],
      origin: map['origin'],
      mainSpe: map['mainSpe'],
      secondSpe: map['secondSpe'],
      mainElement: map['mainElement'],
      secondElement: map['secondElement'],
      kekkaiGenkai: map['kekkaiGenkai'],
      level: map['level'],
      attribute: map['attribute'],
      attributeEnabled: map['attributeEnabled'],
      pointsLeftToSpend: map['pointsLeftToSpend'],
      hpMax: map['hpMax'],
      hp: map['hp'],
      constitution: map['constitution'],
      ninjutsu: map['ninjutsu'],
      taijutsu: map['taijutsu'],
      genjutsu: map['genjutsu'],
      luck: map['luck'],
      perception: map['perception'],
      chakraMax: map['chakraMax'],
      chakra: map['chakra'],
      dodge: map['dodge'],
      throwing: map['throwing'],
      //buffers
      hpBuffer: map['hpBuffer'],
      constitutionBuffer: map['constitutionBuffer'],
      ninjutsuBuffer: map['ninjutsuBuffer'],
      taijutsuBuffer: map['taijutsuBuffer'],
      genjutsuBuffer: map['genjutsuBuffer'],
      luckBuffer: map['luckBuffer'],
      perceptionBuffer: map['perceptionBuffer'],
      chakraBuffer: map['chakraBuffer'],
      dodgeBuffer: map['dodgeBuffer'],
      throwingBuffer: map['throwingBuffer'],
    );
  }

  Map<String, int> kekkaisMap = {
    "[1, 2]": 1, //Koton    //acier
    "[1, 3]": 2, //Futton   //ebullition
    "[1, 4]": 3, //Shakuton //incandescence
    "[1, 5]": 4, //Yoton    //lave
    "[2, 3]": 5, //Ranton    //orage
    "[2, 4]": 6, //Jinton   //poussiere
    "[2, 5]": 7, //Bakuton  //explosion
    "[3, 4]": 8, //Hyoton   //glace
    "[3, 5]": 9, //Mokuton  //bois
    "[4, 5]": 10, //Jiton //Magnétisme
  };

  Future<Character> getCharacter() async {
    return await DbHelper.database.characterDao.findCharacterByName(name);
  }

  Future<void> update() async {
    await DbHelper.database.characterDao.updateCharacter(this);
  }

  Attribute get getAttribute {
    switch (attribute) {
      case 1:
        return Jinchuriki();
      case 2:
        return Shraringan();
      case 3:
        return Byakugan();
      default:
        return Attribute();
    }
  }

  Future<void> addToLogsAndUpdate(String log) async {
    String dt = DateTime.now().toString().substring(0, 19);
    String newLogs = "$dt\n$log\n\n =====================\n";
    logs = newLogs + logs;
    if (logs.length > 10000) {
      logs = logs.substring(0, 10000);
    }
    await update();
  }

  Future<void> setName(String newName) async {
    name = newName;
    await update();
  }

  Future<void> setLevel(int newLevel) async {
    // level = newLevel;
    await addToLogsAndUpdate(
        "Level up : ${newLevel - 1} => $newLevel\nTotal de points à dépenser : $pointsLeftToSpend");
  }

  Future<void> setHpMax(int newHpMax) async {
    // hpMax = newHpMax;
    await addToLogsAndUpdate("Nouveau montant de HP Max : $newHpMax");
  }

  Future<void> setHp(int newHp) async {
    if (attribute == 1) {
      if (attributeEnabled == 0 && newHp <= 20) {
        await attributeBoost(1);
      } else if (attributeEnabled == 1 && newHp > 20) {
        await attributeBoost(0);
      }
    }
    // hp = newHp;
    await addToLogsAndUpdate("Nouveau montant de HP : $newHp");
  }

  Future<void> setConstitution(int newConstitution) async {
    // constitution = newConstitution;
    // await update();
    await addToLogsAndUpdate(
        "Nouveau score de Constitution : $newConstitution");
  }

  Future<void> setNinjutsu(int newNinjutsu) async {
    // ninjutsu = newNinjutsu;
    // await update();
    await addToLogsAndUpdate("Nouveau score de Ninjutsu : $newNinjutsu");
  }

  Future<void> setTaijutsu(int newTaijutsu) async {
    // taijutsu = newTaijutsu;
    // await update();
    await addToLogsAndUpdate("Nouveau score de Taijutsu : $newTaijutsu");
  }

  Future<void> setGenjutsu(int newGenjutsu) async {
    // genjutsu = newGenjutsu;
    // await update();
    await addToLogsAndUpdate("Nouveau score de Genjutsu : $newGenjutsu");
  }

  Future<void> setLuck(int newLuck) async {
    // luck = newLuck;
    // await update();
    await addToLogsAndUpdate("Nouveau score de Luck : $newLuck");
  }

  Future<void> setPerception(int newPerception) async {
    // perception = newPerception;
    // await update();
    await addToLogsAndUpdate("Nouveau score de Perception : $newPerception");
  }

  Future<void> setChakra(int newChakra) async {
    // chakra = newChakra;
    await addToLogsAndUpdate("Nouveau montant de chakra : $newChakra");
  }

  Future<void> setChakraMax(int newChakraMax) async {
    // chakraMax = newChakraMax;
    // await update();
    await addToLogsAndUpdate("Nouveau montant de ChakraMax : $newChakraMax");
  }

  Future<void> setDodge(int newDodge) async {
    // dodge = newDodge;
    // await update();
    await addToLogsAndUpdate("Nouveau score d'esquive / blocage : $newDodge");
  }

  Future<void> setThrowing(int newThrowing) async {
    // throwing = newThrowing;
    // await update();
    await addToLogsAndUpdate("Nouveau score de Lancer : $newThrowing");
  }

  Future<void> setAge(int newAge) async {
    age = newAge;
    await update();
  }

  Future<void> setOrigin(String newOrigin) async {
    origin = newOrigin;
    await update();
  }

  Future<void> setSexe(String newSexe) async {
    sexe = newSexe;
    await update();
  }

  Future<void> setInventory(String newInventory) async {
    inventory = newInventory;
    await addToLogsAndUpdate("Inventaire mis à jour :\n$inventory");
  }

  Future<void> setPointsLeftToSpend(int newPointsLeftToSpend) async {
    // int difference = newPointsLeftToSpend - pointsLeftToSpend;
    // pointsLeftToSpend = newPointsLeftToSpend;
    await addToLogsAndUpdate("Nombre de points restants : $pointsLeftToSpend");
  }

  Future<void> setPicture(String newPicture) async {
    // picture = newPicture;
    // await update();
    await addToLogsAndUpdate("Changement de la photo");
  }

  ///ATTRIBUT
  ///0 : Aucun /
  ///1 : jinchuriki /
  ///2 : Sharingan /
  ///3 : Byakugan /
  Future<void> setAttribute(int newAttribute) async {
    // attribute = newAttribute;
    await update();
  }

  Future<void> attributeBoost(int enabled) async {
    int sign = enabled == 1 ? 1 : -1;
    attributeEnabled = enabled;
    switch (attribute) {
      case 1:
        chakraBuffer += 20 * sign;
        break;
      case 2:
        //sharingan
        ninjutsuBuffer += 5 * sign;
        dodgeBuffer += 5 * sign;
        genjutsuBuffer += 5 * sign;
        chakraBuffer -= 5 * sign;
        constitutionBuffer -= 5 * sign;
        break;
      case 3:
        //byakugan
        taijutsuBuffer += 5 * sign;
        perceptionBuffer += 5 * sign;
        chakraBuffer -= 5 * sign;
        break;
    }
    await addToLogsAndUpdate(
        enabled == 1 ? "Buff d'attribut" : "Débuff d'attribut");
    // await update();
  }

  Future<void> setSpecialityBuffer(int newSpeciality,
      {required bool add}) async {
    int noSpe = 0;
    if (add) {
      if (mainSpe == noSpe) {
        setSpecialityBuffers(mainSpe, newSpeciality);
        mainSpe = newSpeciality;
      } else if (secondSpe == noSpe) {
        setSpecialityBuffers(secondSpe, newSpeciality);
        secondSpe = newSpeciality;
      }
    } else {
      if (mainSpe == newSpeciality) {
        setSpecialityBuffers(mainSpe, noSpe);
        mainSpe = noSpe;
      } else if (secondSpe == newSpeciality) {
        setSpecialityBuffers(secondSpe, noSpe);
        secondSpe = noSpe;
      }
    }
    await update();
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
  //   await update();
  // }

  // Future<void> updateSecondSpeciality(int newSpeciality)async{
  //   setBuffers(secondSpe, newSpeciality);
  //   secondSpe = newSpeciality;
  //   await update();
  // }

  void setSpecialityBuffers(int currentSpeciality, int chosenSpeciality) {
    switch (currentSpeciality) {
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

    switch (chosenSpeciality) {
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
  Future<void> setElement(int newElement, {required bool add}) async {
    if (add) {
      if (mainElement == 0) {
        mainElement = newElement;
      } else if (secondElement == 0) {
        secondElement = newElement;
      }
    } else {
      if (mainElement == newElement) {
        mainElement = 0;
      } else if (secondElement == newElement) {
        secondElement = 0;
      }
    }
    setKekkaiGenkai();
    await update();
  }

  void setKekkaiGenkai() {
    if (mainElement != 0 && secondElement != 0) {
      List<int> characterElements = [mainElement, secondElement];
      characterElements.sort();
      String index = characterElements.toString();
      //buffer : Map<String, dynamic>

      kekkaiGenkai = kekkaisMap[index] ?? 0;
    } else {
      kekkaiGenkai = 0;
    }
  }
}
