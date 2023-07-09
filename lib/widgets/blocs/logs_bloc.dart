import 'package:caracapp/main.dart';
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
      child: FutureBuilder(
        future: dbHelper.retrieveLogs(widget.character.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occurred',
                  style: const TextStyle(fontSize: 18, color: Colors.red),
                ),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return Container(
                constraints: const BoxConstraints(
                  maxWidth: 1000,
                ),
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [...snapshot.data!, const SizedBox()],
                    )),
              );
            } else {
              return const SizedBox();
            }
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
