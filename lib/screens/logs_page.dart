import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:caracapp/utils/color_theme.dart';
import 'package:flutter/material.dart';

class LogsPage extends StatefulWidget {
  final Character character;
  const LogsPage({super.key, required this.character});

  @override
  State<LogsPage> createState() => _LogsPageState();
}

class _LogsPageState extends State<LogsPage> {
  double textFieldWidthPercent = 0.65;
  bool tooHigh = false;
  @override
  void dispose() {
    super.dispose();
    print("TEST disposed");
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width);
    double height = MediaQuery.of(context).size.height;
    if (width > 1000) {
      tooHigh = true;
    } else {
      tooHigh = false;
    }
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: MyColorTheme.colorCustom,
              title: const FittedBox(child: Text("Logs")),
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 10.0, bottom: 10.0),
                  child: Image.asset(
                    "assets/front/back_arrow.jpg",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            body: Container(
              height: height,
              width: width,
              color: Colors.black,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: 16.0,
                      left: width * 0.1,
                      right: width * 0.1,
                      top: 16),
                  child: widget.character.logs != ""
                      ? FittedBox(
                          child: Container(
                            width: width * 0.7,
                            constraints: const BoxConstraints(
                              maxWidth: 1000,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [MyDecoration.boxShadow],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                children: [
                                  Text(widget.character.logs,
                                      style: const TextStyle(
                                        color: Colors.black,
                                      )),
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      constraints: BoxConstraints(
                                          maxWidth: 100, maxHeight: 100),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            widget.character.logs = "";
                                          });
                                        },
                                        child: Image.asset(
                                            "assets/front/trash.jpg",
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: Container(
                //     width: width,
                //     // height: 200,
                //     constraints: const BoxConstraints(
                //       maxWidth: 1000,
                //     ),
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(10),
                //       boxShadow: [MyDecoration.boxShadow],
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Text(widget.character.logs,
                //           style: const TextStyle(
                //             color: Colors.black,
                //             fontSize: 20,
                //           )),
                //     ),
                //   ),
                // ),
              ),
            )));
  }
}



// Row(
//                                 children: [
//                                   Container(
//                                     width: width * 0.4,
//                                     height: width * 0.4,
//                                     constraints: BoxConstraints(
//                                         maxHeight: 300, maxWidth: 300),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: Colors.white,
//                                     ),
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(3.0),
//                                       child: ClipRRect(
//                                         borderRadius: BorderRadius.circular(10),
//                                         child: Image.asset(
//                                             widget.character.picture),
//                                       ),
//                                     ),
//                                   ),
//                                   // Column(
//                                   //   children: [
//                                   //     Text(
//                                   //       "${character.sexe} - ${character.age} ans ",
//                                   //       style: TextStyle(
//                                   //           color: Colors.white,
//                                   //           fontSize: 20,
//                                   //           fontWeight: FontWeight.bold),
//                                   //     )
//                                   //   ],
//                                   // )
//                                 ],
//                               )
