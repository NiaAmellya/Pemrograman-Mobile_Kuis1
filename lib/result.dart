import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Result extends StatelessWidget {
  const Result({
    Key key,
    @required double luas,
    @required double keliling,
  })  : _luas = luas,
        _kel = keliling,
        super(key: key);

  final double _luas;
  final double _kel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              "Luas : ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              _luas.toStringAsFixed(1),
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              "Keliling : ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              _kel.toStringAsFixed(1),
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ],
    );
  }
}
