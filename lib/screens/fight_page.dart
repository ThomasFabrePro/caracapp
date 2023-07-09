// import 'package:caracapp/models/character_model.dart';
// import 'package:caracapp/utils/assets.dart';
// import 'package:flutter/material.dart';

// class FightPage extends StatefulWidget {
//   final Character character;
//   const FightPage({super.key, required this.character});

//   @override
//   State<FightPage> createState() => _FightPageState();
// }

// class _FightPageState extends State<FightPage> {
//   double textFieldWidthPercent = 0.65;
//   bool tooHigh = false;
//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = (MediaQuery.of(context).size.width);
//     double height = MediaQuery.of(context).size.height;
//     if (width > 1000) {
//       tooHigh = true;
//     } else {
//       tooHigh = false;
//     }
//     return SafeArea(
//       child: Container(
//         height: height,
//         width: width,
//         color: Colors.black,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.only(
//                 bottom: 16.0, left: width * 0.1, right: width * 0.1, top: 16),
//             child: widget.character.logs != ""
//                 ? FittedBox(
//                     child: Container(
//                       width: width * 0.7,
//                       constraints: const BoxConstraints(
//                         maxWidth: 1000,
//                       ),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [MyDecoration.boxShadow],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Stack(
//                           children: [
//                             Text(widget.character.logs,
//                                 style: const TextStyle(
//                                   color: Colors.black,
//                                 )),
//                             Positioned(
//                               right: 0,
//                               top: 0,
//                               child: Container(
//                                 width: 50,
//                                 height: 50,
//                                 constraints: const BoxConstraints(
//                                     maxWidth: 100, maxHeight: 100),
//                                 child: GestureDetector(
//                                   onTap: () async {
//                                     setState(() {
//                                       widget.character.logs = "";
//                                     });
//                                     await widget.character.update();
//                                   },
//                                   child: const Icon(
//                                     Icons.delete_outline,
//                                     size: 40,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 : const SizedBox(),
//           ),
//         ),
//       ),
//     );
//   }
// }
