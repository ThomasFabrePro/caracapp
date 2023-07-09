// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:flutDBHelper/screens/models/FlutterDBHelperModelClass.dart';

// import 'package:caracapp/database/database.dart';
// import 'package:sqflite/sqflite.dart';

// class DbHelper {
//   static final _databaseName = "flutDB.db";
//   static final _databaseVersion = 1;
//   static final table = 'tbl_new_db';

//   static final id=1;
//   static final stCol1="stCol1";
//   static final stCol2="stCol2";
//   // static var database;
//   // DbHelper();
//   // Future<DbHelper> constructor() async {
//   //   database =
//   //       await $FloorAppDatabase.databaseBuilder('app_database.db').build();
//   //   return DbHelper();
//   // }

// }
import 'package:caracapp/models/character_model.dart';
import 'package:flutter/material.dart' show Text, TextStyle;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;

  static const tableCharacter = 'CHARACTER';
  static const id = 'id';
  static const name = 'name';
  static const picture = 'picture';
  static const sexe = 'sexe';
  static const age = 'age';
  static const inventory = 'inventory';
  // static const logs = 'logs';
  static const origin = 'origin';
  static const mainSpe = 'mainSpe';
  static const secondSpe = 'secondSpe';
  static const mainElement = 'mainElement';
  static const secondElement = 'secondElement';
  static const kekkaiGenkai = 'kekkaiGenkai';
  static const level = 'level';
  static const attribute = 'attribute';
  static const attributeEnabled = 'attributeEnabled';
  static const pointsLeftToSpend = 'pointsLeftToSpend';
  static const hpMax = 'hpMax';
  static const hp = 'hp';
  static const constitution = 'constitution';
  static const ninjutsu = 'ninjutsu';
  static const taijutsu = 'taijutsu';
  static const genjutsu = 'genjutsu';
  static const luck = 'luck';
  static const perception = 'perception';
  static const chakraMax = 'chakraMax';
  static const chakra = 'chakra';
  static const dodge = 'dodge';
  static const throwing = 'throwing';
  static const hpBuffer = 'hpBuffer';
  static const chakraBuffer = 'chakraBuffer';
  static const constitutionBuffer = 'constitutionBuffer';
  static const ninjutsuBuffer = 'ninjutsuBuffer';
  static const taijutsuBuffer = 'taijutsuBuffer';
  static const genjutsuBuffer = 'genjutsuBuffer';
  static const luckBuffer = 'luckBuffer';
  static const perceptionBuffer = 'perceptionBuffer';
  static const dodgeBuffer = 'dodgeBuffer';
  static const throwingBuffer = 'throwingBuffer';

  static const tableLogs = 'LOGS';
  static const logContent = 'content';

  late Database _db;

  // this opens the database (and creates it if it doesn't exist)
  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $tableCharacter (
            $id INTEGER PRIMARY KEY,
            $name TEXT NOT NULL,
            $picture TEXT NOT NULL,
            $sexe TEXT NOT NULL,
            $age INTEGER NOT NULL,
            $inventory TEXT NOT NULL,
            
            $origin TEXT NOT NULL,
            $mainSpe INTEGER NOT NULL,
            $secondSpe INTEGER NOT NULL,
            $mainElement INTEGER NOT NULL,
            $secondElement INTEGER NOT NULL,
            $kekkaiGenkai INTEGER NOT NULL,
            $level INTEGER NOT NULL,
            $attribute INTEGER NOT NULL,
            $attributeEnabled INTEGER NOT NULL,
            $pointsLeftToSpend INTEGER NOT NULL,
            $hpMax INTEGER NOT NULL,
            $hp INTEGER NOT NULL,
            $constitution INTEGER NOT NULL,
            $ninjutsu INTEGER NOT NULL,
            $taijutsu INTEGER NOT NULL,
            $genjutsu INTEGER NOT NULL,
            $luck INTEGER NOT NULL,
            $perception INTEGER NOT NULL,
            $chakraMax INTEGER NOT NULL,
            $chakra INTEGER NOT NULL,
            $dodge INTEGER NOT NULL,
            $throwing INTEGER NOT NULL,
            $hpBuffer INTEGER NOT NULL,
            $constitutionBuffer INTEGER NOT NULL,
            $ninjutsuBuffer INTEGER NOT NULL,
            $taijutsuBuffer INTEGER NOT NULL,
            $genjutsuBuffer INTEGER NOT NULL,
            $luckBuffer INTEGER NOT NULL,
            $perceptionBuffer INTEGER NOT NULL,
            $chakraBuffer INTEGER NOT NULL,
            $dodgeBuffer INTEGER NOT NULL,
            $throwingBuffer INTEGER NOT NULL
                )
                ''');
    await db.execute('''
          CREATE TABLE $tableLogs (
            $id INTEGER,
            $logContent TEXT NOT NULL
                )
          ''');
  }

  Future<void> insertCharacter(Character character) async {
    await _db.insert(tableCharacter, character.toMap());
  }

  Future<void> insertLog(int characterId, String content) async {
    await _db.insert(tableLogs, {id: characterId, logContent: content});
  }

  Future<Character> retrieveCharacter() async {
    dynamic result = await _db.query(tableCharacter);
    return Character.fromMap(result.first);
  }

  Future<List<Text>> retrieveLogs(int characterId) async {
    dynamic result = await _db.rawQuery(
        'SELECT $logContent FROM $tableLogs WHERE $id = $characterId');
    List<Text> logs = [];
    for (var i = result.length - 1; i >= 0; i--) {
      logs.add(Text(
        result[i][logContent],
        style: const TextStyle(fontSize: 20),
      ));
    }
    return logs;
  }

  Future<List<Character>> findAllCharacters() async {
    final List<Map<String, dynamic>> maps = await _db.query(tableCharacter);
    return List.generate(maps.length, (i) {
      return Character.fromMap(maps[i]);
    });
  }

  Future<int> updateCharacter(Character character) async {
    // int id = row[1];
    return await _db.update(
      tableCharacter,
      character.toMap(),
    );
  }

  Future<void> clearLogs(int characterId) async {
    await _db.delete(
      tableLogs,
      where: '$id = ?',
      whereArgs: [characterId],
    );
  }
}
