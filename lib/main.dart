import 'package:calculator/game_board/game_board.dart';
import 'package:calculator/game_board_splash/game_board_splash.dart';
import 'package:flutter/material.dart';


import 'home_screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName : (context)=>HomeScreen(),
        GameBoard.routeName : (_)=>GameBoard(),
        GameBoardSplash.routeName : (_)=>GameBoardSplash(),
      },
      initialRoute:GameBoardSplash.routeName,

    );
  }
}
