import 'package:bilgioyunu/cons.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MainPage());
}

Question soru1 = Question(
    question: 'Everest Dağı, dünyanın en yüksek dağıdır', answer: true);

Question soru2 =
    Question(question: 'Avustralya\'nın başkenti Sydney\'dir', answer: false);

Question soru3 = Question(
    question: 'Dünya\'nın çevresi yaklaşık 40,075 kilometredir', answer: true);

Question soru4 = Question(
    question: 'Albert Einstein, izafiyet teorisini geliştiren bilim insanıdır',
    answer: true);

Question soru5 = Question(
    question: 'Venüs, Güneş Sistemi\'ndeki en sıcak gezegendir', answer: true);

Question soru6 = Question(
    question:
        'Hindistan, Çin\'den sonra dünyanın en kalabalık ikinci ülkesidir',
    answer: true);

Question soru7 = Question(
    question: 'Titanic, 1912 yılında ilk yolculuğunda battı', answer: true);

Question soru8 = Question(
    question: 'Wright kardeşler, ilk başarılı uçağı icat ettiler',
    answer: true);

Question soru9 = Question(
    question: 'Mona Lisa tablosu, Vincent van Gogh tarafından yapılmıştır',
    answer: false);

Question soru10 = Question(
    question:
        'Roma İmparatorluğu, Batı Roma İmparatorluğu\'nun düşüşüyle MS 476\'da sona erdi',
    answer: true);

Question soru11 =
    Question(question: 'Nil Nehri, Afrika\'nın en uzun nehridir', answer: true);

Question soru12 =
    Question(question: 'Küba\'nın başkenti Lima\'dır', answer: false);

Question soru13 = Question(
    question: 'İnsan vücudunda en büyük organ, cilt (deri) organıdır',
    answer: true);

Question soru14 =
    Question(question: 'Dünya\'nın tek doğal uydusu Mars\'tır', answer: false);

Question soru15 =
    Question(question: 'Japonya, Asya kıtasında yer alır', answer: true);

Question soru16 = Question(
    question: 'Christopher Columbus, Amerika\'yı keşfeden ilk Avrupalıdır',
    answer: false);

Question soru17 = Question(
    question: 'Amazon Yağmur Ormanları, Güney Amerika\'da yer alır',
    answer: true);

Question soru18 = Question(
    question: 'Demir, periyodik tabloda \'Fe\' sembolü ile gösterilir',
    answer: true);

Question soru19 = Question(
    question: 'En küçük atom numarasına sahip element, helyumdur',
    answer: false);

Question soru20 = Question(
    question: 'Louvre Müzesi, Londra\'da bulunmaktadır', answer: false);

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
  int index = 0;
  bool? response;
  List<Widget> Selections = <Widget>[];
  List<Question> BankOfQuestions = [
    soru1,
    soru2,
    soru3,
    soru4,
    soru5,
    soru6,
    soru7,
    soru8,
    soru9,
    soru10,
    soru11,
    soru12,
    soru13,
    soru14,
    soru15,
    soru16,
    soru17,
    soru18,
    soru19,
    soru20
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 4,
          child: Center(
            child: Text(
              BankOfQuestions[index].question!,
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
                          setState(() {
                            bool accurasy = BankOfQuestions[index].answer!;
                            if (accurasy == false) {
                              Selections.add(CorrectIcon);
                            } else {
                              Selections.add(WrongIcon);
                            }
                            index++;
                          });
                        },
                        icon: Icon(
                          Icons.thumb_down,
                          color: Colors.red,
                        ))),
                Expanded(
                    child: IconButton(
                        onPressed: () {
                          print('2.');
                          setState(() {
                            bool accurasy = BankOfQuestions[index].answer!;
                            if (accurasy == true) {
                              Selections.add(CorrectIcon);
                            } else {
                              Selections.add(WrongIcon);
                            }
                            index++;
                          });
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
