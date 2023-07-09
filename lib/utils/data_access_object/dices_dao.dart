import 'package:caracapp/models/dice_model.dart';
import 'package:floor/floor.dart';
import 'package:caracapp/models/character_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

@dao
abstract class DicesDao {
  @Query('SELECT * FROM Dices')
  Future<Map<String, dynamic>> findAllDices();

  // @Query('SELECT * FROM Dices WHERE id = :id')
  // Future<Dice?> findDiceById(int id);

  // @Query('SELECT * FROM Dices WHERE name = :name')
  // Future<Dice?> findDiceByName(String name);

  @insert
  Future<void> insertDice(Dice character);

  @update
  Future<void> updateDice(Dice character);
}
