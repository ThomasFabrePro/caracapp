import 'package:caracapp/database/database.dart';
import 'package:caracapp/database/db_helper.dart';
import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/viewmodels/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class CharacterViewModel extends BaseViewModel {
  Character _character = Character();
  final _blocAData = BehaviorSubject<String>();
  final _blocJutsusData = BehaviorSubject<int>();

  Stream<String> get blocAData => _blocAData.stream;
  Stream<int> get blocJutsusData => _blocJutsusData.stream;
  // Getter for accessing the character data
  Character get character => _character;

  set character(Character character) {
    _character = character;
  }

  // Method for loading the character data from the database
  Future<void> loadCharacter() async {
    // Set the loading state to true
    setLoading(true);
    print("character name : ${character.name}");
    character = await character.getCharacter();
    setCharacter(character);
    // Perform the database operation to load the character
    // For example: _character = await databaseHelper.getCharacter();

    // Set the loading state to false
    setLoading(false);
  }

  void updateBlocJutsusData(int newChakra) {
    // Perform any necessary operations with the new data

    // Notify other blocs by adding the new data to the corresponding stream
    _blocJutsusData.add(newChakra);
  }
  // Future<void> createCharacter() async {
  //   // Set the loading state to true
  //   setLoading(true);
  //   final AppDatabase database = DbHelper.database;

  //   final characterDao = database.characterDao;
  //   List<Character> list = await characterDao.findAllCharacters();

  //   await character.getCharacter();
  //   // Perform the database operation to load the character
  //   // For example: _character = await databaseHelper.getCharacter();

  //   // Set the loading state to false
  //   setLoading(false);
  // }

  // Other methods for character-related operations can be added here
}
