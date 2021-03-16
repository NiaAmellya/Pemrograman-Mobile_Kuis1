import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  //widget input untuk memasukkan nilai awal
  const Input({
    Key key,
    @required this.panjang, // membutuhkan textcontroller panjang
    @required this.lebar, // membutuhkan textcontroller lebar
    double pjg, // inisialisasi pjg
    double lbr, //inisialisasi lbr
  }) : super(key: key);

  final TextEditingController panjang; //inisialisasi text controller panjang
  final TextEditingController lebar; //inisialisasi text controller lebar

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
              child: TextFormField(
                  controller:
                      panjang, //controller yang akan digunakan adalah panjang
                  decoration: InputDecoration(
                      labelText:
                          "Panjang/Sisi/Alas", // membuat label yang apabila diklik terletak di bagian atas outline
                      border: OutlineInputBorder(
                          // unutuk memberi outline
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: "Masukkan angka"), //membuat hint text atau text samar-samar sebagai tampilan awal
                  keyboardType: TextInputType.number, //membuat keyboard hanya bisa menerima masukan sebagai nomor
                  inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ])),
          Expanded(
              child: TextFormField(
                  controller:
                      lebar, //controller yang akan digunakan adalah lebar
                  decoration: InputDecoration(
                      labelText:
                          "Lebar/Sisi/Tinggi", // membuat label yang apabila diklik terletak di bagian atas outline
                      border: OutlineInputBorder(
                          // unutuk memberi outline
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: "Masukkan angka"), //membuat hint text atau text samar-samar sebagai tampilan awal
                  keyboardType: TextInputType.number, //membuat keyboard hanya bisa menerima masukan sebagai nomor
                  inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              ]))
        ]);
  }
}
