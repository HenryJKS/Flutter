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
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final s = 50.0;
  final m = 300.0;
  final l = 500.0;
  final maxSize = 500.0;
  final minSize = 50.0;
  final increment = 50.0;

  double tamanho = 300;
  int red = 0; // 0 ate 255
  int gren = 0; // 0 ate 255
  int blue = 0; // 0 ate 255

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(red, gren, blue, 1),
        title: const Text('Stateful'),
        actions: [
          IconButton(
            onPressed: () {
              if (tamanho > minSize) {
                setState(() {
                  tamanho -= increment;
                });
              }
            },
            icon: const Icon(Icons.remove),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                tamanho = s;
              });
            },
            icon: const Text('S'),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                tamanho = m;
              });
            },
            icon: const Text('M'),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                tamanho = l;
              });
            },
            icon: const Text('L'),
          ),
          IconButton(
            onPressed: () {
              if (tamanho < maxSize) {
                setState(() {
                  tamanho += increment;
                });
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Icon(
                Icons.access_alarm_rounded,
                size: tamanho,
                color: Color.fromRGBO(red, gren, blue, 1),
              ),
            ),
          ),
          Slider(
            activeColor: Colors.red,
            divisions: 255,
            label: 'red: $red',
            min: 0,
            max: 255,
            value: red.toDouble(), // 1 para 1.0
            onChanged: (double value) {
              setState(() {
                red = value.toInt(); // 1.4 para 1
              });
            },
          ),
          Slider(
            activeColor: Colors.green,
            min: 0,
            max: 255,
            value: gren.toDouble(), // 1 para 1.0
            onChanged: (double value) {
              setState(() {
                gren = value.toInt(); // 1.4 para 1
              });
            },
          ),
          Slider(
            activeColor: Colors.blue,
            min: 0,
            max: 255,
            value: blue.toDouble(), // 1 para 1.0
            onChanged: (double value) {
              setState(() {
                blue = value.toInt(); // 1.4 para 1
              });
            },
          ),
        ],
      ),
    );
  }
}
