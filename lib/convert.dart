import 'package:flutter/material.dart';

class Convert extends StatelessWidget {
  //widget untuk button Konversi Berat
  Function konvertHandler;
  Convert({Key key, @required this.konvertHandler});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed:
            konvertHandler, //mengatur button ketika ditekan akan ada perubahan
        color: Colors.green[200], // memberi warna hijau pada button
        textColor: Colors.white, // memberi warna putih pada text
        child: Text(
          "Hitung ",
          style: TextStyle(fontSize: 20), // mengatur ukuran font pada text
        ),
      ),
    );
  }
}
