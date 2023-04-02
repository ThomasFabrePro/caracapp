import 'package:caracapp/database/database.dart';
import 'package:caracapp/models/character_model.dart';
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
    character = Character(1, 'Personnage');
    await characterDao.insertCharacter(character);
  } else {
    character = list[0];
  }
  runApp(MyApp(character: character, characterDao: characterDao));
}

class MyApp extends StatelessWidget {
  Character character;
  CharacterDao characterDao;
  MyApp({super.key, required this.character, required this.characterDao});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carac App',
      theme: ThemeData(
        primarySwatch: MyColorTheme.colorCustom,
      ),
      home: MyHomePage(
          title: 'Carac App Home Page',
          character: character,
          characterDao: characterDao),
    );
  }
}

class MyHomePage extends StatefulWidget {
  Character character;
  CharacterDao characterDao;
  MyHomePage(
      {super.key,
      required this.title,
      required this.character,
      required this.characterDao});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "";
  // TextEditingController textController = TextEditingController();
  @override
  void initState() {
    title = widget.title;
    // textController.text = "coucou";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            MyAppBar(
                character: widget.character, characterDao: widget.characterDao),
            CharacterPicture(),
          ],
        ),
      ),
    );
  }
}
