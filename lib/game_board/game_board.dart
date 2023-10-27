import 'package:calculator/model/game_board_data_model.dart';
import 'package:flutter/material.dart';

import '../GameBoardButton.dart';
import '../game_board_button.dart';

class GameBoard extends StatefulWidget{
  static String routeName= "GameBoard";


  @override
  State<StatefulWidget> createState() {
    return GameBoardState();
  }

}

class GameBoardState extends State {
  TextStyle playerNameTextStyle = TextStyle(color: Colors.black,fontSize: 28,);
  int player1= 0;
  int player2 = 0 ;
  int counter =0;

  List <String > board = [
    "" , "" , "" ,
    "" , "" , "" ,
    "" , "" , "" ,
  ];


  @override
  Widget build (BuildContext context) {
    GameBoardModel model = ModalRoute.of(context)!.settings.arguments as GameBoardModel;
    return Scaffold(
        appBar: AppBar(
          title: Text("GameBoard ",style: TextStyle(fontSize: 22),),
        ),
        body:Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("${model.player1} :$player1 ",style: playerNameTextStyle),
                  Text("${model.player2}  : $player2",style: playerNameTextStyle),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GameBoardButton(symbol:board[0],onClick: onButtonClick,index: 0,),
                  GameBoardButton(symbol:board[1],onClick: onButtonClick,index: 1,),
                  GameBoardButton(symbol:board[2],onClick:onButtonClick,index: 2,),

                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GameBoardButton(symbol:board[3],onClick: onButtonClick,index: 3,),
                  GameBoardButton(symbol:board[4],onClick: onButtonClick,index: 4,),
                  GameBoardButton(symbol:board[5],onClick: onButtonClick,index: 5,),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GameBoardButton(symbol:board[6],onClick:onButtonClick,index: 6,),
                  GameBoardButton(symbol:board[7],onClick:onButtonClick,index: 7,),
                  GameBoardButton(symbol:board[8],onClick: onButtonClick,index: 8,),

                ],
              ),
            ),

          ],
        )
    );

  }
  void onButtonClick(int index){
    if (board[index].isNotEmpty)return;

    String symbol = counter %2==0 ? "X" : "0";
    board[index]= symbol;
    counter++;
    setState(() {});

    if (checkWinner(symbol)){
      if (symbol == "X")player1++;
      else
        player2++;
      boardClear();
    }

    if (draw())
      setState(() {
      });




  }

  void boardClear (){
     board = [
      "" , "" , "" ,
      "" , "" , "" ,
      "" , "" , "" ,
    ];
     counter =0 ;
    setState(() {
    });

  }

  bool draw (){
    bool drawCase= false ;
    if (counter ==9 ){
      boardClear();
      drawCase= true;
    }
    return drawCase;



  }


  bool checkWinner (String symbol){

    for (int i=0 ;i<=6;i+=3){
      if (board[i]==symbol && board[i+1]==symbol && board[i+2]==symbol)
        return true;
    }

    for (int i=0 ;i<=2;i++) {
      if (board[i] == symbol && board[i + 3] == symbol &&
          board[i + 6] == symbol)
        return true;
    }

        if (board[0]==symbol && board[4]==symbol && board[8]==symbol)
          return true;

      if (board[2]==symbol && board[4]==symbol && board[6]==symbol)
        return true;

      return false;



  }





  }


