import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;

  String _infoText = "Pode Entrar";

  void _changePeople(int delta) {
    setState(() {
      _infoText = "Pode Entrar";
      _people += delta;
      if (_people <= 0) {
        _people = 0;
      } else if (_people >= 10) {
        _people = 10;
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                          child: Text("+ 1",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white)),
                          onPressed: () {
                            _changePeople(1);
                            //_people++;
                            //debugPrint("+1");
                          }),
                      FlatButton(
                          child: Text("- 1",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white)),
                          onPressed: () {
                            _changePeople(-1);
                            //_people--;
                            //debugPrint("-1");
                          }),
                    ],
                  ),
                ),
              ],
            ),
            Text(_infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0)),
          ],
        ),
      ],
    );
  }
}
