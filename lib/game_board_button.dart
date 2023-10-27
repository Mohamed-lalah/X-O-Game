

import 'package:flutter/material.dart';

class GameBoardButton extends StatelessWidget {
  late String symbol ;
  late Function onClick;
  late int index ;


  GameBoardButton({required this.symbol, required this.onClick,required this.index});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(8),
          child: ElevatedButton(onPressed: (){
            onClick(index);
          },
              child: Text(symbol,style: TextStyle(
                fontSize: 26
              ),)
          ),
        )
    );

  }
}
