// import 'package:caracapp/models/jutsu_model.dart';
// import 'package:caracapp/utils/assets.dart';
// import 'package:flutter/material.dart';

// class JutsuCard extends StatefulWidget {
//   final Jutsu jutsu;
//   final int characterNinjutsuValue;
//   const JutsuCard(
//       {super.key, required this.jutsu, required this.characterNinjutsuValue});

//   @override
//   State<JutsuCard> createState() => _JutsuCardState();
// }

// class _JutsuCardState extends State<JutsuCard> {
//   bool showDescription = false;
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double containerHeight = 90;
//     bool isAvailable =
//         widget.jutsu.ninjutsuMinimum <= widget.characterNinjutsuValue;

//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Container(
//         width: width,
//         height: containerHeight,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: GestureDetector(
//           onTap: () {
//             setState(() {
//               showDescription = !showDescription;
//             });
//           },
//           child: Stack(
//             children: [
//               Row(children: [
//                 Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: SizedBox(
//                       height: 70,
//                       width: 70,
//                       child: Image.asset(widget.jutsu.image),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: showDescription
//                       ? Padding(
//                           padding: const EdgeInsets.only(
//                               top: 7.0, bottom: 7.0, right: 7.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Flexible(
//                                 child: Text(widget.jutsu.name,
//                                     style: const TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold)),
//                               ),
//                               // Container(
//                               //   // width: width,
//                               //   height: containerHeight,
//                               // child:

//                               Text(
//                                 // textAlign: TextAlign.center,
//                                 widget.jutsu.description,
//                                 style: MyDecoration.dataStyle,
//                               ),
//                               // ),
//                             ],
//                           ),
//                         )
//                       : Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(widget.jutsu.name,
//                                 style: const TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold)),
//                             Text("Coût Chakra : ${widget.jutsu.chakraCost}",
//                                 style: MyDecoration.dataStyle),
//                             Text(
//                                 "Requis : Ninjutsu ≥ ${widget.jutsu.ninjutsuMinimum}",
//                                 style: TextStyle(
//                                   color:
//                                       isAvailable ? Colors.black : Colors.red,
//                                   fontSize: 18,
//                                 )),
//                             Text("Malus au dé : ${widget.jutsu.malus}",
//                                 style: MyDecoration.dataStyle),
//                           ],
//                         ),
//                 )
//               ]),
//               Container(
//                 width: width,
//                 height: containerHeight,
//                 decoration: BoxDecoration(
//                   color:
//                       isAvailable ? null : Colors.grey[900]!.withOpacity(0.5),
//                   borderRadius: BorderRadius.circular(10),
//                   // boxShadow: [MyDecoration.boxShadow],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:math';

import 'package:caracapp/models/jutsu_model.dart';
import 'package:caracapp/utils/assets.dart';
import 'package:flutter/material.dart';

class JutsuCard extends StatefulWidget {
  final Jutsu jutsu;
  final int characterNinjutsuValue;
  const JutsuCard(
      {super.key, required this.jutsu, required this.characterNinjutsuValue});

  @override
  State<JutsuCard> createState() => _JutsuCardState();
}

class _JutsuCardState extends State<JutsuCard> {
  bool _showFrontSide = true;
  bool _displayFront = true;
  bool _flipYAxis = true;
  Widget _buildFront() {
    return __buildLayout(
      key: ValueKey(true),
      jutsu: widget.jutsu,
      paddingValues: 0,
      isAvailable:
          widget.jutsu.ninjutsuMinimum <= widget.characterNinjutsuValue,
      showDescription: false,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget _buildRear() {
    return __buildLayout(
      key: ValueKey(false),
      jutsu: widget.jutsu,
      paddingValues: 0,
      isAvailable:
          widget.jutsu.ninjutsuMinimum <= widget.characterNinjutsuValue,
      showDescription: true,
      width: MediaQuery.of(context).size.width,
    );
  }

  // Widget __buildLayout({
  //   required Key key,
  //   required Jutsu jutsu,
  //   required double paddingValues,
  //   required double width,
  //   required bool isAvailable,
  //   required bool showDescription,
  // }) {
  //   double containerHeight = 90;
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 8.0),
  //     child: Container(
  //       width: width,
  //       height: containerHeight,
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Stack(
  //         children: [
  //           Row(children: [
  //             Padding(
  //               padding: const EdgeInsets.all(10.0),
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(10),
  //                 child: SizedBox(
  //                   height: 70,
  //                   width: 70,
  //                   child: Image.asset(jutsu.image),
  //                 ),
  //               ),
  //             ),
  //             Expanded(
  //               child: showDescription
  //                   ? Padding(
  //                       padding: const EdgeInsets.only(
  //                           top: 7.0, bottom: 7.0, right: 7.0),
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Flexible(
  //                             child: Text(jutsu.name,
  //                                 style: const TextStyle(
  //                                     fontSize: 18,
  //                                     fontWeight: FontWeight.bold)),
  //                           ),

  //                           Text(
  //                             jutsu.description,
  //                             style: MyDecoration.dataStyle,
  //                           ),
  //                           // ),
  //                         ],
  //                       ),
  //                     )
  //                   : Column(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(jutsu.name,
  //                             style: const TextStyle(
  //                                 fontSize: 18, fontWeight: FontWeight.bold)),
  //                         Text("Coût Chakra : ${jutsu.chakraCost}",
  //                             style: MyDecoration.dataStyle),
  //                         Text("Requis : Ninjutsu ≥ ${jutsu.ninjutsuMinimum}",
  //                             style: TextStyle(
  //                               color: isAvailable ? Colors.black : Colors.red,
  //                               fontSize: 18,
  //                             )),
  //                         Text("Malus au dé : ${jutsu.malus}",
  //                             style: MyDecoration.dataStyle),
  //                       ],
  //                     ),
  //             )
  //           ]),
  //           Container(
  //             width: width,
  //             height: containerHeight,
  //             decoration: BoxDecoration(
  //               color: isAvailable ? null : Colors.grey[900]!.withOpacity(0.5),
  //               borderRadius: BorderRadius.circular(10),
  //               // boxShadow: [MyDecoration.boxShadow],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
  Widget __buildLayout({
    required Key key,
    // required String faceName,
    // required Color backgroundColor,
    required Jutsu jutsu,
    required double paddingValues,
    required double width,
    required bool isAvailable,
    required bool showDescription,
  }) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.asset(jutsu.image),
                ),
              ),
            ),
            Expanded(
              child: showDescription
                  ? Padding(
                      padding: const EdgeInsets.only(
                          top: 7.0, bottom: 7.0, right: 7.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(jutsu.name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),

                          Text(
                            jutsu.description,
                            style: MyDecoration.dataStyle,
                          ),
                          // ),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(jutsu.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Coût Chakra : ${jutsu.chakraCost}",
                            style: MyDecoration.dataStyle),
                        Text("Requis : Ninjutsu ≥ ${jutsu.ninjutsuMinimum}",
                            style: TextStyle(
                              color: isAvailable ? Colors.black : Colors.red,
                              fontSize: 18,
                            )),
                        Text("Malus au dé : ${jutsu.malus}",
                            style: MyDecoration.dataStyle),
                      ],
                    ),
            )
          ]),
          Container(
            width: width,
            height: 90,
            decoration: BoxDecoration(
              color: isAvailable ? null : Colors.grey[900]!.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
              // boxShadow: [MyDecoration.boxShadow],
            ),
          )
        ],
      ),
    );
    // );
  }

  // Widget _buildFront() {
  //   return __buildLayout(
  //     key: ValueKey(true),
  //     backgroundColor: Colors.blue,
  //     faceName: "F",
  //   );
  // }

  // Widget _buildRear() {
  //   return __buildLayout(
  //     key: ValueKey(false),
  //     backgroundColor: Colors.blue.shade700,
  //     faceName: "R",
  //   );
  // }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: () => setState(() {
        _showFrontSide = !_showFrontSide;
        // print("TEST touché");
      }),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        transitionBuilder: __transitionBuilder,
        // layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        child: _showFrontSide ? _buildFront() : _buildRear(),
        // switchInCurve: Curves.easeInBack,
        // switchOutCurve: Curves.easeOutBack,
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget!.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _displayFront = true;
    _flipYAxis = true;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double containerHeight = 90;
    bool isAvailable =
        widget.jutsu.ninjutsuMinimum <= widget.characterNinjutsuValue;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        width: width,
        height: containerHeight,
        decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: _buildFlipAnimation(),
      ),
    );
  }
}

Widget __buildLayout({
  required Key key,
  required Jutsu jutsu,
  required double paddingValues,
  required double width,
  required bool isAvailable,
  required bool showDescription,
}) {
  double containerHeight = 90;
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Container(
      key: key,
      width: width,
      height: containerHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.asset(jutsu.image),
                ),
              ),
            ),
            Expanded(
              child: showDescription
                  ? Padding(
                      padding: const EdgeInsets.only(
                          top: 7.0, bottom: 7.0, right: 7.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(jutsu.name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),

                          Text(
                            jutsu.description,
                            style: MyDecoration.dataStyle,
                          ),
                          // ),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(jutsu.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("Coût Chakra : ${jutsu.chakraCost}",
                            style: MyDecoration.dataStyle),
                        Text("Requis : Ninjutsu ≥ ${jutsu.ninjutsuMinimum}",
                            style: TextStyle(
                              color: isAvailable ? Colors.black : Colors.red,
                              fontSize: 18,
                            )),
                        Text("Malus au dé : ${jutsu.malus}",
                            style: MyDecoration.dataStyle),
                      ],
                    ),
            )
          ]),
          Container(
            width: width,
            height: containerHeight,
            decoration: BoxDecoration(
              color: isAvailable ? null : Colors.grey[900]!.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
              // boxShadow: [MyDecoration.boxShadow],
            ),
          )
        ],
      ),
    ),
  );
}
