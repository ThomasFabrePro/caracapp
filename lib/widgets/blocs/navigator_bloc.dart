import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/screens/logs_page.dart';
import 'package:caracapp/utils/assets.dart';
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
                  route: LogsPage(
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

class NavigatorBox extends StatefulWidget {
  final String title;
  final String iconPath;
  final double size;
  final Widget route;
  const NavigatorBox(
      {super.key,
      required this.size,
      required this.route,
      required this.iconPath,
      required this.title});

  @override
  State<NavigatorBox> createState() => _NavigatorBoxState();
}

class _NavigatorBoxState extends State<NavigatorBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.route),
        );
      },
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.black,
                boxShadow: [MyDecoration.boxShadow]),
            width: widget.size,
            height: widget.size,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: MyDecoration.bloodColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      widget.iconPath,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              // color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
