import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }
}

class _StudentAddState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yeni öğrenci ekleme"),
      ),
      body: Center(
        child: Text("Bu da bir diğer dersin konusu.."),
      ),
    );
  }
}
