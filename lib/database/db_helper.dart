import 'package:caracapp/database/database.dart';

class DbHelper {
  // static final DbHelper _dbHelper = DbHelper._internal();
  static var database;
  // DbHelper._internal();
  DbHelper();
  Future<DbHelper> constructor() async {
    database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return DbHelper();
  }
}
