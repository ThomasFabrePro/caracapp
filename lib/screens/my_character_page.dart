// import 'package:caracapp/models/character_model.dart';
// import 'package:caracapp/widgets/blocs/caracteristics_bloc.dart';
// import 'package:caracapp/widgets/blocs/inventory_bloc.dart';
// import 'package:caracapp/widgets/blocs/jutsus_bloc.dart';
// import 'package:caracapp/widgets/blocs/photo_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:caracapp/viewmodels/character_view_model.dart';

// class MyCharacterPage extends StatefulWidget {
//   @override
//   State<MyCharacterPage> createState() => _MyCharacterPageState();
// }

// class _MyCharacterPageState extends State<MyCharacterPage> {
//   // final Character character;
//   final CharacterViewModel characterViewModel = CharacterViewModel();

//   @override
//   void initState() {
//     super.initState();
//     loadCharacter();
//   }

//   Future<void> loadCharacter() async {
//     await characterViewModel.loadCharacter();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // double textFieldWidthPercent = 0.65;

//     double width = (MediaQuery.of(context).size.width);
//     double height = MediaQuery.of(context).size.height;
//     return SafeArea(
//       child: StreamBuilder<bool>(
//         stream: characterViewModel.isLoading,
//         builder: (context, snapshot) {
//           final isLoading = snapshot.data ?? false;
//           if (isLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else {
//             // Display the character data using characterViewModel.character
//             // For example: Text(characterViewModel.character.name)
//             print("TEST character : ${characterViewModel.character.toMap()}");
//             return Container(
//               height: height,
//               width: width,
//               color: const Color.fromARGB(255, 0, 0, 0),
//               child: Stack(
//                 children: [
//                   Center(
//                     child: Container(
//                       constraints: const BoxConstraints(
//                         maxWidth: 1000,
//                       ),
//                       width: width,
//                       height: height,
//                       child: FittedBox(
//                         fit: BoxFit.contain,
//                         child: Image.asset(
//                           "assets/front/background2.jpg",
//                         ),
//                       ),
//                     ),
//                   ),
//                   SingleChildScrollView(
//                       child: Column(
//                     children: <Widget>[
//                       const SizedBox(height: 20),
//                       PhotoBloc(characterViewModel.character),
//                       const SizedBox(height: 20),
//                       Divider(
//                           endIndent: width * 0.1,
//                           indent: width * 0.1,
//                           color: Colors.white,
//                           thickness: 2),
//                       CaracteristicsBloc(
//                         character: characterViewModel.character,
//                         isEditable: false,
//                       ),
//                       const SizedBox(height: 20),
//                       Divider(
//                           endIndent: width * 0.1,
//                           indent: width * 0.1,
//                           color: Colors.white,
//                           thickness: 2),
//                       JutsuBloc(
//                         character: characterViewModel.character,
//                         canDice: true,
//                       ),
//                       const SizedBox(height: 20),
//                       Divider(
//                           endIndent: width * 0.1,
//                           indent: width * 0.1,
//                           color: Colors.white,
//                           thickness: 2),
//                       InventoryBloc(character: characterViewModel.character),
//                       const SizedBox(height: 20),
//                     ],
//                   )),
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

import 'package:caracapp/models/character_model.dart';
import 'package:caracapp/widgets/blocs/caracteristics_bloc.dart';
import 'package:caracapp/widgets/blocs/inventory_bloc.dart';
import 'package:caracapp/widgets/blocs/jutsus_bloc.dart';
import 'package:caracapp/widgets/blocs/photo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:caracapp/viewmodels/character_view_model.dart';

class MyCharacterPage extends StatefulWidget {
  @override
  State<MyCharacterPage> createState() => _MyCharacterPageState();
}

class _MyCharacterPageState extends State<MyCharacterPage> {
  // final Character character;
  final CharacterViewModel characterViewModel = CharacterViewModel();

  @override
  void initState() {
    super.initState();
    loadCharacter();
  }

  @override
  void dispose() {
    characterViewModel.dispose();
    super.dispose();
  }

  Future<void> loadCharacter() async {
    await characterViewModel.loadCharacter();
  }

  @override
  Widget build(BuildContext context) {
    // double textFieldWidthPercent = 0.65;

    double width = (MediaQuery.of(context).size.width);
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: StreamBuilder<bool>(
        stream: characterViewModel.isLoading,
        builder: (context, snapshot) {
          final isLoading = snapshot.data ?? false;
          return isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : StreamBuilder<Character>(
                  stream: characterViewModel.characterStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final character = snapshot.data!;
                      // Display the character data using the character object
                      // For example: Text(character.name)
                      return Container(
                        height: height,
                        width: width,
                        color: const Color.fromARGB(255, 0, 0, 0),
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
                                child: Column(
                              children: <Widget>[
                                const SizedBox(height: 20),
                                PhotoBloc(character),
                                const SizedBox(height: 20),
                                Divider(
                                    endIndent: width * 0.1,
                                    indent: width * 0.1,
                                    color: Colors.white,
                                    thickness: 2),
                                CaracteristicsBloc(
                                  character: character,
                                  isEditable: false,
                                  characterViewModel: characterViewModel,
                                ),
                                const SizedBox(height: 20),
                                Divider(
                                    endIndent: width * 0.1,
                                    indent: width * 0.1,
                                    color: Colors.white,
                                    thickness: 2),
                                JutsuBloc(
                                  character: character,
                                  canDice: true,
                                  characterViewModel: characterViewModel,
                                ),
                                const SizedBox(height: 20),
                                Divider(
                                    endIndent: width * 0.1,
                                    indent: width * 0.1,
                                    color: Colors.white,
                                    thickness: 2),
                                InventoryBloc(character: character),
                                const SizedBox(height: 20),
                              ],
                            )),
                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      // Handle the error state
                      return Text('Error: ${snapshot.error}');
                    } else {
                      // Handle the initial state when data is not available yet
                      return const Center(
                        child: Text('No character data available.'),
                      );
                    }
                  },
                );
        },
      ),
    );
  }
}
