import 'package:caracapp/database/database.dart';

class DbHelper {
  static var database;
  DbHelper();
  Future<DbHelper> constructor() async {
    database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    return DbHelper();
  }
}
