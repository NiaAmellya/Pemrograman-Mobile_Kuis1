import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/rendering/box.dart';
import 'input.dart'; //import widget input
import 'result.dart'; //import widget result
import 'convert.dart'; //import widget convert

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController panjang =
      new TextEditingController(); // membuat controller untuk input angka pada bagian panjang
  TextEditingController lebar =
      new TextEditingController(); // membuat controller untuk input angka pada bagian lebar

  double _panjang = 0; // inisialisasi panjang
  double _lebar = 0; //inisialisasi lebar
  var listItem = [
    "Persegi",
    "Persegi Panjang",
    "Segitiga Sama Sisi"
  ]; // item-item yang akan ditampilkan pada dropdown
  String _newValue = "Persegi"; // membuat nilai default pada dropdown
  double _luas = 0; //inisialisasi luas
  double _kel = 0; //inisialisasi keliling
  List<String> listViewItem =
      List<String>(); //inisialisasi array untuk menampilkan item

  void _perhitungan() {
    //fungsi perhitungan
    setState(() {
      _panjang = double.parse(panjang.text); //inputan dari string ke double
      _lebar = double.parse(lebar.text); //inputan dari string ke double

      if (_newValue == "Persegi") {
        _luas =
            _panjang * _lebar; //perhitungan jika value dropdown persegi luas
        _kel = ((2 * _panjang) +
            (2 * _lebar)); //perhitungan jika value dropdown persegi keliling
      } else if (_newValue == "Persegi Panjang") {
        _luas = _panjang *
            _lebar; //perhitungan jika value dropdown persegi panjang luas
        _kel = ((2 * _panjang) +
            (2 *
                _lebar)); //perhitungan jika value dropdown persegi panjang keliling
      } else if (_newValue == "Segitiga Sama Sisi") {
        _luas = ((_panjang * _lebar) *
            1 /
            2); //perhitungan jika value dropdown segitiga luas
        _kel = (_panjang +
            _lebar +
            _panjang); //perhitungan jika value dropdown segitiga luas
      }
      addItemToList(); //memasukkan item ke dalam fungsi addItemToList
    });
  }

  void addItemToList() {
    //fungsi untuk menyimpan secara otomatis nilai pada listView
    setState(() {
      String hasil1 = _newValue + " : " + _luas.toStringAsFixed(1);
      listViewItem.insert(0, hasil1);
      String hasil2 = _newValue + " : " + _kel.toStringAsFixed(1);
      listViewItem.insert(0, hasil2);
    });
  }

  void dropdownOnChanged(String changeValue) {
    //membuat fungsi ketika dropdown berubah otomatis nilai akan berubah
    setState(() {
      _newValue = changeValue;
      _perhitungan(); // memanggil fungsi perhitungan
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green, // memberi warna hijau pada up bar
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perhitungan Luas"), // memberi judul pada up bar
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, //memberi jarak
            children: <Widget>[
              Input(
                  panjang: panjang,
                  lebar:
                      lebar), //memanggil widget input untuk menyimpan nilai panjang dan lebar
              DropdownButton<String>(
                //memanggil widget dropdown
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: dropdownOnChanged,
              ),
              Result(
                  luas: _luas,
                  keliling:
                      _kel), //memanggil widget Result fungsi luas dan keliling
              Convert(
                  konvertHandler:
                      _perhitungan), //memanggil widget convert fungsi perhitungan
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Hitungan", // memasukkan keterangan riwayat konversi
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded //expanded digunakan agar listview bisa muncul
                  (child: RiwayatHitungan(listViewItem: listViewItem))
            ],
          ),
        ),
      ),
    );
  }
}

class RiwayatHitungan extends StatelessWidget {
  //widget untuk menyimpan riwayat konversi
  const RiwayatHitungan({
    Key key,
    @required this.listViewItem, //membutuhkan listViewItem
  }) : super(key: key);

  final List<String> listViewItem; //inisialisasi array listViewItem

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listViewItem.map((String value) {
        //mengubah suatu nilai menjadi nilai yang baru
        return Container(
            margin: EdgeInsets.all(10), //mengatur margin
            child: Text(
              value, //memberi text atau keterangan berupa riwayat hitungan nantinya (berupa value)
              style: TextStyle(
                  fontSize:
                      15), //mengatur style pada text, disini dilakukan pengaturan size atau ukuran saja
            ));
      }).toList(),
    );
  }
}
