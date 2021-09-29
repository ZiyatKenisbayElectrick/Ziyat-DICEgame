import 'package:flutter/material.dart';

import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Игра в кости"),
        centerTitle: true,
      ),
      body: Dice(),
    ),
  ));
}
  
class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);
  @override
  _DiceState createState() => _DiceState();
}
  
class _DiceState extends State<Dice> {
  int one = 1;
  int two = 1;
  String result = "";
  
  void rollDice() {
    setState(() {
      one = Random().nextInt(6) + 1;
      two = Random().nextInt(6) + 1;
      
      if (one > two) {
        result = "Победу одержал 1 -вый игрок!";
      } else if (two > one) {
        result = "Победу одержал 2- ой игрок!";
      } else {
        result = "Ничья";
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return newMethod();
  }

  Column newMethod() {
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "Игрок 1",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              MaterialButton(
                child: Image.asset('images/${one.toString()}.jpg',
                    height: 150, width: 150),
                onPressed: () {
                  rollDice();
                },
              ),
              
            ],
          ),
          
          Column(
            children: [
              Text(
                "Игрок 2",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              MaterialButton(
                child: Image.asset(
                  'images/${two.toString()}.jpg',
                  height: 150,
                  width: 150,
                ),
                onPressed: () {
                  rollDice();
                },
              ),
              
            ],
          )
        ],
      ),

      Text(
        result,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    ],
  );
  }
}