import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Expanded buttonMaker({required Color color, required Text character, var alpha}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          // playSound(alpha);
        },
        child: character,
        // color: color,
      ),
    );
  }

  // void playSound(var alpha) {
  //   final player = AudioCache();
  //   player.play('$alpha.mp3');
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SingleChildScrollView(
                  child: Row(
                    verticalDirection: VerticalDirection.up,
                    children: <Widget>[
                      buttonMaker(
                        color: Colors.pink,
                        character: Text(
                          'A',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'a',
                      ),
                      buttonMaker(
                        color: Colors.cyan,
                        character: Text(
                          'B',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'b',
                      ),
                      buttonMaker(
                        color: Colors.indigo,
                        character: Text(
                          'C',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'c',
                      ),
                      buttonMaker(
                        color: Colors.greenAccent,
                        character: Text(
                          'D',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'd',
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Row(
                    verticalDirection: VerticalDirection.up,
                    children: <Widget>[
                      buttonMaker(
                        color: Colors.pink,
                        character: Text(
                          'E',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'e',
                      ),
                      buttonMaker(
                        color: Colors.deepOrange,
                        character: Text(
                          'F',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'f',
                      ),
                      buttonMaker(
                        color: Colors.teal,
                        character: Text(
                          'G',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'g',
                      ),
                      buttonMaker(
                        color: Colors.brown,
                        character: Text(
                          'H',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'h',
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Row(
                    verticalDirection: VerticalDirection.up,
                    children: <Widget>[
                      buttonMaker(
                        color: Colors.purple,
                        character: Text(
                          'I',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'i',
                      ),
                      buttonMaker(
                        color: Colors.lightBlue,
                        character: Text(
                          'J',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'j',
                      ),
                      buttonMaker(
                        color: Colors.blueGrey,
                        character: Text(
                          'K',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'k',
                      ),
                      buttonMaker(
                        color: Colors.blue,
                        character: Text(
                          'L',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'l',
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Row(
                    verticalDirection: VerticalDirection.up,
                    children: <Widget>[
                      buttonMaker(
                        color: Colors.pink,
                        character: Text(
                          'M',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'm',
                      ),
                      buttonMaker(
                        color: Colors.indigo,
                        character: Text(
                          'N',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'n',
                      ),
                      buttonMaker(
                        color: Colors.red,
                        character: Text(
                          'O',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'o',
                      ),
                      buttonMaker(
                        color: Colors.cyanAccent,
                        character: Text(
                          'P',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'p',
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Row(
                    verticalDirection: VerticalDirection.up,
                    children: <Widget>[
                      buttonMaker(
                        color: Colors.lightBlue,
                        character: Text(
                          'Q',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'q',
                      ),
                      buttonMaker(
                        color: Colors.teal,
                        character: Text(
                          'R',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'r',
                      ),
                      buttonMaker(
                        color: Colors.lime,
                        character: Text(
                          'S',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 's',
                      ),
                      buttonMaker(
                        color: Colors.deepPurple,
                        character: Text(
                          'T',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 't',
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Row(
                    verticalDirection: VerticalDirection.up,
                    children: <Widget>[
                      buttonMaker(
                        color: Colors.lightGreen,
                        character: Text(
                          'U',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'u',
                      ),
                      buttonMaker(
                        color: Colors.green,
                        character: Text(
                          'V',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'v',
                      ),
                      buttonMaker(
                        color: Colors.red,
                        character: Text(
                          'W',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'w',
                      ),
                      buttonMaker(
                        color: Colors.teal,
                        character: Text(
                          'X',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'x',
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Row(
                    verticalDirection: VerticalDirection.up,
                    children: <Widget>[
                      buttonMaker(
                        color: Colors.pink,
                        character: Text(
                          'Y',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'y',
                      ),
                      buttonMaker(
                        color: Colors.indigo,
                        character: Text(
                          'Z',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'z',
                      ),
                      buttonMaker(
                        color: Colors.purpleAccent,
                        character: Text(
                          '😁',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'note5',
                      ),
                      buttonMaker(
                        color: Colors.blue,
                        character: Text(
                          '😃',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        alpha: 'note1',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}