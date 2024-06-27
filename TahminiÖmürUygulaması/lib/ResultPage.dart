import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tema/computing.dart';
import 'package:tema/user_Data.dart';

class Result_Page extends StatelessWidget {
  final UserData? userdata;

  Result_Page({this.userdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.calculate),
        title: Text('Sonuç ekranı'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 9,
            child: Center(
              child: Text(
                  Computing(userdata: userdata).compute().round().toString()),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text('Geri Dön'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
