import 'package:flutter/material.dart';

class IconGender extends StatelessWidget {
  final String? gender;
  final IconData? icon;

  IconGender({this.gender, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
        ),
        SizedBox(height: 10), // Add spacing between icon and text
        Text(gender!),
      ],
    );
  }
}
