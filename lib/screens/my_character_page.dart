import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/color_theme.dart';
import 'package:caracapp/utils/data_access_object/character_dao.dart';
import 'package:caracapp/widgets/lowerWidgets/app_bar.dart';
import 'package:caracapp/widgets/character_picture.dart';
import 'package:flutter/material.dart';

class MyCharacterPage extends StatefulWidget {
  Character character;
  MyCharacterPage({
    super.key,
    required this.title,
    required this.character,
  });

  final String title;

  @override
  State<MyCharacterPage> createState() => _MyCharacterPageState();
}

class _MyCharacterPageState extends State<MyCharacterPage> {
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: MyColorTheme.colorCustom,
            title: FittedBox(
                child: Text(
                    "${widget.character.name} de ${widget.character.origin}")),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
                child: Image.asset(
                  "assets/front/star.jpg",
                  color: Colors.white,
                ),
              ),
            ),
          ),
          body: Container(
              height: height,
              width: width,
              color: Color.fromARGB(255, 0, 0, 0),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 1000,
                      ),
                      width: width,
                      height: height,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Image.asset(
                          "assets/front/background2.jpg",
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 24),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: width * 0.4,
                                height: width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child:
                                        Image.asset(widget.character.picture),
                                  ),
                                ),
                              ),
                              Column()
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ))),
    );
  }
}
