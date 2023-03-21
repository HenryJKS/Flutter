import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;
  String msg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$contador'),
      ),
      body: Center(
        child: Text('$msg'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        backgroundColor: Color.fromARGB(255, 0, 230, 8),
        child: Icon(Icons.add),
      ),
    );
  }

  void _increment() {
    setState(() {
      if (contador < 10) {
        contador++;
      } else {
        msg = 'Atingiu limite';
      }
    });
  }
}
