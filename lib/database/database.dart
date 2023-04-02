// database.dart

// required package imports
import 'dart:async';
import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/data_access_object/character_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

// import 'dao/person_dao.dart';
// import 'entity/person.dart';

part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Character])
abstract class AppDatabase extends FloorDatabase {
  CharacterDao get characterDao;
}
