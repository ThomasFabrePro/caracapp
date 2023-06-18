import 'package:caracapp/database/database.dart';
import 'package:caracapp/database/db_helper.dart';
import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/screens/add_character_page.dart';
import 'package:caracapp/screens/free_dices_page.dart';
import 'package:caracapp/screens/level_up_page.dart';
import 'package:caracapp/screens/logs_page.dart';
import 'package:caracapp/screens/my_character_page.dart';
import 'package:caracapp/utils/color_theme.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper().constructor();
  final AppDatabase database = DbHelper.database;

  final characterDao = database.characterDao;
  Character character;
  List<Character> list = await characterDao.findAllCharacters();
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
}

class MyApp extends StatefulWidget {
  final Character character;
  final bool addCharacter;
  const MyApp({super.key, required this.character, required this.addCharacter});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 2;

  void setCurrentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carac App',
      theme: ThemeData(
        primarySwatch: MyColorTheme.colorCustom,
      ),
      home: widget.addCharacter
          ? AddCharacterPage(
              character: widget.character,
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: MyColorTheme.colorCustom,
                title: Center(
                  child: FittedBox(
                    child: [
                      const Text("Logs"),
                      Text(
                        "${widget.character.name} de ${widget.character.origin}\n${widget.character.sexe} - ${widget.character.age} ans - level ${widget.character.level}",
                        textAlign: TextAlign.center,
                      ),
                      const Text("Level Up"),
                      const Text("Dés libres"),
                    ][_currentIndex],
                  ),
                ),
                leading: _currentIndex == 0
                    ? GestureDetector(
                        onTap: () async {
                          widget.character.logs = "";

                          await widget.character.update();
                          setCurrentIndex(1);
                        },
                        child: const Icon(
                          Icons.delete_outline,
                          size: 40,
                        ),
                      )
                    : null,
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: (index) => setCurrentIndex(index),
                showUnselectedLabels: true,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.grey,
                type: BottomNavigationBarType.fixed,
                backgroundColor: MyColorTheme.colorCustom,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.auto_graph_outlined),
                    label: "Level Up",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.playlist_add_check_outlined),
                    label: "Logs",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_search_outlined),
                    label: "Perso",
                  ),
                  BottomNavigationBarItem(
                    // icon: Icon(Icons.),
                    icon: Icon(Icons.heat_pump),
                    label: "Dés",
                  ),
                ],
              ),
              body: [
                LevelUpPage(character: widget.character),
                LogsPage(character: widget.character),
                MyCharacterPage(character: widget.character),
                FreeDicesPage(character: widget.character),
              ][_currentIndex],
            ),
    );
  }
}
