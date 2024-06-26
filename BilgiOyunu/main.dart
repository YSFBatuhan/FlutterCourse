import 'package:bilgioyunu/cons.dart';
import 'package:bilgioyunu/test_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bilgi Oyunu'),
        ),
        body: Questions(),
      ),
    );
  }
}

class Questions extends StatefulWidget {
  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  bool? response;
  List<Widget> Selections = <Widget>[];
  Testdata test_1 = Testdata();
  void Button(bool selectedButton) {
    if (test_1.isFinished() == true) {
      print('vaavvv');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tebrikler'),
              content: Text('Oyun bitti'),
              actions: [
                new TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      test_1.reset();
                      Selections = [];
                    });
                  },
                  child: Text('Başa Dön'),
                )
              ],
            );
          });
    }

    setState(() {
      bool accurasy = test_1.getQuestionAnswer();
      if (accurasy == selectedButton) {
        Selections.add(CorrectIcon);
      } else {
        Selections.add(WrongIcon);
      }
      test_1.NextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Text(
              test_1.getQuestionText(),
              style: TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Wrap(
          //bu widget satır dolduğunda alta geçmesini sağlar
          direction: Axis.horizontal, //yatay şekil
          //runSpacing: ,satır arası boşluk
          //spacinh : yan yana iki element arası boşluk
          children: Selections,
        ),
        Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          print('1.');
                          Button(false);
                        },
                        icon: Icon(
                          Icons.thumb_down,
                          color: Colors.red,
                        ))),
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          print('2.');
                          Button(true);
                        },
                        icon: Icon(
                          Icons.thumb_up,
                          color: Colors.green,
                        )))
              ],
            ))
      ],
    );
  }
}

class Question {
  String? question;
  bool? answer;
  Question({@required this.question, @required this.answer});
}
