import 'package:flutter/material.dart';

class PrimaryBg extends StatelessWidget {
  const PrimaryBg({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff213a50), Color(0xff071930)],
              begin: FractionalOffset.topRight,
              end: FractionalOffset.bottomLeft)),
    );
  }
}
