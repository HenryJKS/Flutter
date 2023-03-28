import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  double inicial = 300;
  double red = 0;
  double blue = 0;
  double green = 0;
  
  void aumentar() {
    setState(() {
      if (inicial == 500) {
        inicial = 300;
      }
      inicial += 50;
    });
  }

  void diminuir() {
    setState(() {
      if (inicial == 50) {
        inicial = 300;
      }
      inicial -= 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Exemplo'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                diminuir();
              });
            },
            icon: const Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                inicial = 50;
              });
            },
            icon: const Text('S'),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                inicial = 300;
              });
            },
            icon: const Text('M'),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                inicial = 500;
              });
            },
            icon: const Text('L'),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                aumentar();
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Icon(
              Icons.alarm,
              size: inicial,
              color: Color.fromARGB(255, red.toInt(), green.toInt(), blue.toInt()),
            ),
          ),
          Slider(
              min: 0,
              max: 255,
              value: red,
              divisions: 255,
              onChanged: (double value) {
                setState(() {
                  red = value;
                });
              },
              activeColor: Colors.red),
          Slider(
              min: 0,
              max: 255,
              value: green,
              divisions: 255,
              onChanged: (double value) {
                setState(() {
                  green = value;
                });
              },
              activeColor: Colors.green),
          Slider(
              min: 0,
              max: 255,
              value: blue,
              divisions: 255,
              onChanged: (double value) {
                setState(() {
                  blue = value;
                });
              },
              activeColor: Colors.blue),
        ],
      ),
    );
  }
}
