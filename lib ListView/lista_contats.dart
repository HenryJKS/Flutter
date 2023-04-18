
import 'package:flutter/material.dart';
import 'package:projeto180423/contatos.dart';

class ListaContatos extends StatefulWidget {
  const ListaContatos({Key? key}) : super(key: key);

  @override
  State<ListaContatos> createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  //Criar Lista
  List<Contato> contatos = [
    Contato('Henry', 'abc@gmail.com'),
    Contato('Tu', 'cde@gmail.com'),
    Contato('Ele', 'fgh@gmail.com'),
    Contato('Ela', 'ijk@gmail.com'),
    Contato('Nós', 'lmn@gmail.com'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: ListView.builder(
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text(contatos[index].nomeCompleto.substring(0, 1)),),
            title: Text(contatos[index].nomeCompleto),
            subtitle: Text(contatos[index].email),
          );
        }
      ),
    );
  }
}
