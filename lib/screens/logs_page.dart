import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/widgets/blocs/logs_bloc.dart';

import 'package:flutter/material.dart';

class LogsPage extends StatefulWidget {
  final Character character;
  const LogsPage({super.key, required this.character});

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  double textFieldWidthPercent = 0.65;

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
        height: height,
        width: width,
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Center(
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
                    fit: BoxFit.contain,
                    child: Image.asset(
                      "assets/front/background2.jpg",
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Center(
                  child: LogsBloc(
                    character: widget.character,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
