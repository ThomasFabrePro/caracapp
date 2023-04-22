import 'dart:math';

import 'package:caracapp/database/database.dart';
import 'package:caracapp/database/db_helper.dart';
import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/screens/add_character_page.dart';
import 'package:caracapp/screens/my_character_page.dart';
// import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/utils/color_theme.dart';
import 'package:caracapp/utils/data_access_object/character_dao.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper().constructor();
  final AppDatabase database = DbHelper.database;

  final characterDao = database.characterDao;
  Character character;
  List<Character> list = await characterDao.findAllCharacters();
  // int fakeId = Random().nextInt(10000000);
  if (list.isEmpty) {
    character = Character(picture: "assets/ninja_images/ninja_3.jpg");
    await characterDao.insertCharacter(character);
    runApp(MyApp(
      character: character,
      addCharacter: true,
    ));
  } else {
    character = list[0];
    runApp(MyApp(
      character: character,
      addCharacter: false,
    ));
  }
  //!FAKE
  // if (list.isEmpty) {
  //   character = Character(
  //       id: fakeId, name: 'Ashley', picture: "assets/ninja_images/ninja_1.jpg");
  //   await characterDao.insertCharacter(character);
  //   runApp(MyApp(
  //     character: character,
  //     characterDao: characterDao,
  //     addCharacter: true,
  //   ));
  // } else {
  //   character = list[0];
  //   runApp(MyApp(
  //     character: character,
  //     characterDao: characterDao,
  //     addCharacter: true,
  //   ));
  // }
  //!STOP FAKE
}

class MyApp extends StatelessWidget {
  final Character character;
  final bool addCharacter;
  const MyApp({super.key, required this.character, required this.addCharacter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carac App',
      theme: ThemeData(
        primarySwatch: MyColorTheme.colorCustom,
      ),
      home: addCharacter
          ? AddCharacterPage(
              character: character,
            )
          : MyCharacterPage(
              // title: 'Carac App Home Page',
              character: character,
            ),
    );
  }
}
