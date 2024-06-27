import 'package:flutter/material.dart';

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
