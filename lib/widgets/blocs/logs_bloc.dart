import 'package:caracapp/models/character_model.dart';
import 'package:flutter/material.dart';

class LogsBloc extends StatefulWidget {
  final Character character;
  const LogsBloc({
    super.key,
    required this.character,
  });

  @override
  State<LogsBloc> createState() => _LogsBlocState();
}

class _LogsBlocState extends State<LogsBloc> {
  @override
  Widget build(BuildContext context) {
    double width = double.infinity;
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0, top: 16),
      child: widget.character.logs != ""
          ? Container(
              constraints: const BoxConstraints(
                maxWidth: 1000,
              ),
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.character.logs,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
