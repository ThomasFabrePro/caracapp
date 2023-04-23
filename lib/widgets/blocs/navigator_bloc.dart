import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/screens/level_up_page.dart';
import 'package:caracapp/screens/logs_page.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/widgets/lowerWidgets/navigator_box.dart';
import 'package:flutter/material.dart';

class NavigatorBloc extends StatefulWidget {
  final Character character;
  const NavigatorBloc({super.key, required this.character});

  @override
  State<NavigatorBloc> createState() => _NavigatorBlocState();
}

class _NavigatorBlocState extends State<NavigatorBloc> {
  @override
  Widget build(BuildContext context) {
    double size = (MediaQuery.of(context).size.width * 0.2).clamp(0, 200);
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 20.0, top: 10),
          child: Text("Navigation",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 1000),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavigatorBox(
                  title: "Logs",
                  iconPath: "assets/front/paper_icon.jpg",
                  size: size,
                  route: LogsPage(
                    character: widget.character,
                  ),
                ),
                NavigatorBox(
                  title: "Combat",
                  iconPath: "assets/front/route_icons/swords_icon.jpg",
                  size: size,
                  route: LogsPage(
                    character: widget.character,
                  ),
                ),
                NavigatorBox(
                  title: "Level UP",
                  iconPath: "assets/front/route_icons/level_up.jpg",
                  size: size,
                  route: LevelUpPage(
                    character: widget.character,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
