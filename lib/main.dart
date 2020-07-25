import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  static const String _title = 'Solid Software test task';

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: MyApp(),
    ));
  }
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _indexR;
  int _indexG;
  int _indexB;
  double _opacity;

  /*
  * At the beginning the app starts with white background
  * */
  @override
  void initState() {
    super.initState();
    _indexR = 255;
    _indexG = 255;
    _indexB = 255;
    _opacity = 1;
  }

  void setColorState(PointerEvent e) => setState(() {
        final random = Random();
        _indexR = random.nextInt(255);
        _indexG = random.nextInt(255);
        _indexB = random.nextInt(255);
        _opacity = random.nextDouble();
      });

  @override
  Widget build(BuildContext context) {
    return Listener(
          onPointerDown: setColorState,
          child: Scaffold(
            body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Hey there',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Color.fromRGBO(255 - _indexR, 255 - _indexG,
                                255 - _indexB, 1)))
                  ])
            ),
            backgroundColor: Color.fromRGBO(_indexR, _indexG, _indexB, _opacity),
          )
        );
  }
}
