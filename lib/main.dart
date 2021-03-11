import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/rendering/box.dart';
import 'input.dart';
import 'result.dart';
import 'convert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
// This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController panjang = new TextEditingController();
  TextEditingController lebar = new TextEditingController();

  double _panjang = 0;
  double _lebar = 0;
  var listItem = ["Persegi", "Persegi Panjang"];
  String _newValue = "Persegi";
  double _luas = 0;
  List<String> listViewItem = List<String>();

  void _perhitungan() {
    setState(() {
      _panjang = double.parse(panjang.text);
      _lebar = double.parse(lebar.text);

      if (_newValue == "Persegi") _luas = _panjang * _lebar;
      //else
      //_result = (4 / 5) * nCelcius;
      addItemToList();
    });
  }

  void addItemToList() {
    setState(() {
      String hasil = _newValue + " : " + _luas.toStringAsFixed(1);
      listViewItem.insert(0, hasil);
    });
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
      _perhitungan();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Perhitungan Luas"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Input(panjang: panjang, lebar: lebar),
              DropdownButton<String>(
                items: listItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: _newValue,
                onChanged: dropdownOnChanged,
              ),
              Result(result: _luas),
              Convert(konvertHandler: _perhitungan),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Riwayat Hitungan",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Expanded(child: RiwayatHitungan(listViewItem: listViewItem))
            ],
          ),
        ),
      ),
    );
  }
}

class RiwayatHitungan extends StatelessWidget {
  const RiwayatHitungan({
    Key key,
    @required this.listViewItem,
  }) : super(key: key);

  final List<String> listViewItem;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listViewItem.map((String value) {
        return Container(
            margin: EdgeInsets.all(10),
            child: Text(
              value,
              style: TextStyle(fontSize: 15),
            ));
      }).toList(),
    );
  }
}