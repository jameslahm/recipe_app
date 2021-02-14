import 'package:flutter/material.dart';

class BrandName extends StatelessWidget {
  const BrandName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "AppGuy",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontFamily: "Overpass"),
        ),
        Text(
          "Recipe",
          style: TextStyle(
              color: Colors.blue, fontSize: 18, fontFamily: "Overpass"),
        )
      ],
    );
  }
}
