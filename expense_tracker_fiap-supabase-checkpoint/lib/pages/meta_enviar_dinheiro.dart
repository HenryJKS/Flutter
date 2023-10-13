import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MetaEnviarDinheiro extends StatefulWidget {
  const MetaEnviarDinheiro({super.key});

  @override
  State<MetaEnviarDinheiro> createState() => _MetaEnviarDinheiroState();
}

class _MetaEnviarDinheiroState extends State<MetaEnviarDinheiro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enviar Dinheiro para Meta')),
    );
  }
}