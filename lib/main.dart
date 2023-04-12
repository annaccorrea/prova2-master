import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculadoraScreen(),
    );
  }
}

class CalculadoraScreen extends StatefulWidget {
  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  String _visor = '';

  void _clicarbutton(String value) {
    setState(() {
      _visor += value;
    });
  }

  void _limparVisor() {
    setState(() {
      _visor = '';
    });
  }

  void _calcular() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _visor,
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(
            height: 1.0,
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            children: <Widget>[
              _button('C', Colors.green),
              _button('/', Colors.pink),
              _button('*', Colors.pink),
              _button('-', Colors.pink),
              _button('7'),
              _button('8'),
              _button('9'),
              _button('+', Colors.pink),
              _button('4'),
              _button('5'),
              _button('6'),
              _button('=', Colors.blue),
              _button('1'),
              _button('2'),
              _button('3'),
              _button('.', Colors.blue),
              _button('0'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _button(String label, [Color color = Colors.black]) {
    return TextButton(
      onPressed: () {
        if (label == '=') {
          _calcular();
        } else if (label == 'C') {
          _limparVisor();
        } else {
          _clicarbutton(label);
        }
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(16.0),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 24.0, color: color),
      ),
    );
  }
}
