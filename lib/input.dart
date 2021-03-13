import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.panjang,
    @required this.lebar,
    double pjg,
    double lbr,
  }) : super(key: key);

  final TextEditingController panjang;
  final TextEditingController lebar;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              child: TextFormField(
                  controller: panjang,
                  decoration: InputDecoration(
                      labelText: "Panjang/Sisi/Alas",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: "Masukkan angka"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ])),
          Expanded(
              child: TextFormField(
                  controller: lebar,
                  decoration: InputDecoration(
                      labelText: "Lebar/Sisi/Tinggi",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: "Masukkan angka"),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ]))
        ]);
  }
}
