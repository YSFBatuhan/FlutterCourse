import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tema/ResultPage.dart';
import 'package:tema/icongender.dart';
import 'package:tema/user_Data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MyContainer extends StatelessWidget {
  final Color? renk;
  final Widget? child;

  MyContainer({this.renk = Colors.white, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: renk,
      ),
      child: child,
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedGender;
  double countCigarette = 0;
  double countTraining = 0;
  double height = 170;
  double weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RotatedBox(
                          child: Text(
                            'Boy',
                            style: TextStyle(fontSize: 20),
                          ),
                          quarterTurns: -1,
                        ),
                        RotatedBox(
                          child: Text(
                            height.round().toString(),
                            style: TextStyle(
                                fontSize: 25, color: Colors.lightBlue),
                          ),
                          quarterTurns: -1,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonTheme(
                              minWidth: 36,
                              buttonColor: Colors.lightBlue,
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    height++;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.plus),
                                style: ButtonStyle(),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  height--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RotatedBox(
                          child: Text(
                            'Kilo',
                            style: TextStyle(fontSize: 20),
                          ),
                          quarterTurns: -1,
                        ),
                        RotatedBox(
                          child: Text(
                            weight.round().toString(),
                            style: TextStyle(
                                fontSize: 25, color: Colors.lightBlue),
                          ),
                          quarterTurns: -1,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonTheme(
                              minWidth: 36,
                              buttonColor: Colors.lightBlue,
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(FontAwesomeIcons.plus),
                                style: ButtonStyle(),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                children: [
                  Text(
                    'Haftada kaç gün spor yapıyorsunuz ',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    '${countTraining.round()} ',
                    style: TextStyle(fontSize: 25, color: Colors.lightBlue),
                  ),
                  Slider(
                    min: 0,
                    max: 7,
                    value: countTraining,
                    onChanged: (double newvalue) {
                      setState(() {
                        countTraining = newvalue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                children: [
                  Text(
                    'Günde kaç sigara içiyorsunuz ? ',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    '${countCigarette.round()}',
                    style: TextStyle(fontSize: 25, color: Colors.lightBlue),
                  ),
                  Slider(
                    min: 0,
                    max: 30,
                    value: countCigarette,
                    onChanged: (double newvalue) {
                      setState(() {
                        countCigarette = newvalue;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Erkek';
                      });
                    },
                    child: MyContainer(
                      renk: selectedGender == 'Erkek'
                          ? Colors.blue
                          : Colors.white,
                      child: IconGender(
                        gender: 'Erkek',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Kadın';
                      });
                    },
                    child: MyContainer(
                      renk: selectedGender == 'Kadın'
                          ? Colors.pinkAccent[200]
                          : Colors.white,
                      child: IconGender(
                        gender: 'Kadın',
                        icon: FontAwesomeIcons.venus,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 15,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Result_Page(
                              userdata: UserData(
                                  countCigarette: countCigarette,
                                  countTraining: countTraining,
                                  weight: weight,
                                  height: height,
                                  selectedGender: selectedGender),
                            )));
              },
              child: Text(
                'Hesapla',
              ),
            ),
          )
        ],
      ),
    );
  }
}
