import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  //widget untuk menampilkan result
  const Result({
    Key key,
    @required double luas, //membutuhkan variabel luas
    @required double keliling, //membutuhkan variabel keliling
  })  : _luas =
            luas, //memberi nilai variabel luas dengan nilai pada variabel _luas yang terletak pada file main.dart
        _kel =
            keliling, //memberi nilai variabel keliling dengan nilai pada variabel _kel yang terletak pada file main.dart
        super(key: key);

  final double _luas; //inisialisasi variabel _luas
  final double _kel; //inisialisasi variabel _kel
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, //memberi jarak
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              "Luas : ", // memberi keterangan
              style: TextStyle(fontSize: 20), // mengatur ukuran font
            ),
            Text(
              _luas.toStringAsFixed(
                  1), // untuk membatasi agar angka tidak panjang
              style: TextStyle(fontSize: 30), //mengatur ukuran font
            )
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              "Keliling : ", // memberi keterangan
              style: TextStyle(fontSize: 20), //mengatur ukuran font
            ),
            Text(
              _kel.toStringAsFixed(
                  1), // untuk membatasi agar angka tidak panjang
              style: TextStyle(fontSize: 30), //mengatur ukuran font
            )
          ],
        ),
      ],
    );
  }
}
