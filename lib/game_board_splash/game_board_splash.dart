import 'package:flutter/material.dart';

import '../game_board/game_board.dart';
import '../model/game_board_data_model.dart';

class GameBoardSplash extends StatelessWidget {

  static const String routeName= "Game_Board_Splash";


  TextEditingController player1Controller = TextEditingController();
  String player2 ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Game board splash ",style: TextStyle(color: Colors.black,fontSize: 26),),
      ),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20,),
          TextField(
            controller: player1Controller,
            decoration: InputDecoration(
              labelText: "Player 1",
              filled: true,
              fillColor: Colors.green,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(35)
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(35)
              ),
            ),
          ),
          SizedBox(height: 20,),
          TextField(
            onChanged: (text){
              player2=text;
            },
            decoration: InputDecoration(
                labelText: "Player 2 ",
                filled: true,
                fillColor: Colors.orange,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(25)
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(35)
                ),
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, GameBoard.routeName,
              arguments: GameBoardModel(player1: player1Controller.text, player2: player2));

            }, child: Text("Start")),
          )
        ],
      ),
    );
  }
}
