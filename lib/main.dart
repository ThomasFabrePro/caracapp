import 'package:caracapp/database/database.dart';
import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/screens/add_character_page.dart';
import 'package:caracapp/screens/my_character_page.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/utils/color_theme.dart';
import 'package:caracapp/utils/data_access_object/character_dao.dart';
import 'package:caracapp/widgets/app_bar.dart';
import 'package:caracapp/widgets/character_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// void main() {
//   runApp(const MyApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  final characterDao = database.characterDao;
  Character character;
  List<Character> list = await characterDao.findAllCharacters();
  if (list.isEmpty) {
    // character = Character(1, 'Personnage', MyImages().imagePath[image.ninja2]!);
    // await characterDao.insertCharacter(character);
    runApp(MyApp(
      character:
          Character(1, 'Personnage', MyImages().imagePath[image.ninja2]!),
      characterDao: characterDao,
      addCharacter: true,
    ));
  } else {
    character = list[0];
    runApp(MyApp(
      character: character,
      characterDao: characterDao,
      addCharacter: false,
    ));
  }
}

class MyApp extends StatelessWidget {
  Character character;
  CharacterDao characterDao;
  bool addCharacter;
  MyApp(
      {super.key,
      required this.character,
      required this.characterDao,
      required this.addCharacter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carac App',
      theme: ThemeData(
        primarySwatch: MyColorTheme.colorCustom,
      ),
      home: addCharacter
          ? AddCharacterPage(characterDao: characterDao)
          : MyCharacterPage(
              title: 'Carac App Home Page',
              character: character,
              characterDao: characterDao),
    );
  }
}
