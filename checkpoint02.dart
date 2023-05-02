import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactsPage(),
    );
  }
}

class ContactsPage extends StatefulWidget {
  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final contacts = [
    Contact(name: "John Doe", email: 'john_doeoe@gmail.com'),
    Contact(name: "Alice O. Austin", email: 'AliceOAustin@rhyta.com'),
    Contact(name: "Douglas R. Broadway", email: 'DouglasRBroadway@dayrep.com'),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title:  Text('Contatos ${contacts.where((c) => c.favorito).length}'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text(contacts[index].name[0])),
            title: Text(contacts[index].name),
            subtitle: Text(contacts[index].email),
            trailing: IconButton(icon:  contacts[index].favorito 
                                 ? new Icon(Icons.favorite, color: Colors.red)
                                 : new Icon(Icons.favorite_border),
                                 onPressed: () {
                                   setState(() {
                                     contacts[index].favorito = !contacts[index].favorito;
                                   });
           
            },),
          );
        },
      ),
    );
  }
}

class Contact {
  String name;
  String email;
  bool favorito;

  Contact({required this.name, required this.email, this.favorito = false});
}
