import 'package:floor/floor.dart';
import 'package:caracapp/models/character_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

@dao
abstract class CharacterDao {
  @Query('SELECT * FROM Character')
  Future<List<Character>> findAllCharacters();

  @Query('SELECT * FROM Character')
  Future<Character?> findCharacter();

  @Query('SELECT * FROM Character WHERE name = :name')
  Future<Character?> findCharacterByName(String name);

  @insert
  Future<void> insertCharacter(Character character);

  @update
  Future<void> updateCharacter(Character character);
}
