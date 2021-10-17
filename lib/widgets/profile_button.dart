import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 20, top: 40, bottom: 0),
      child: IconButton(
          iconSize: 60.0, icon: Icon(Icons.person_outlined), onPressed: null),
    );
  }
}
