import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

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
          MaterialPageRoute(
              builder: (context) => widget.route, maintainState: false),
        );
        deactivate();
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
