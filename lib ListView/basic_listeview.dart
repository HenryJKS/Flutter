import 'package:flutter/material.dart';

class BasicListView extends StatefulWidget {
  const BasicListView({Key? key}) : super(key: key);

  @override
  State<BasicListView> createState() => _BasicListViewState();
}

class _BasicListViewState extends State<BasicListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic ListView'),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Title 1'),
            subtitle: Text('Subtitle 1'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Title 2'),
            subtitle: Text('Subtitle 2'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Title 3'),
            subtitle: Text('Subtitle 3'),
          ),
           ListTile(
            leading: Icon(Icons.home),
            title: Text('Title 1'),
            subtitle: Text('Subtitle 1'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Title 2'),
            subtitle: Text('Subtitle 2'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Title 3'),
            subtitle: Text('Subtitle 3'),
          ),
           ListTile(
            leading: Icon(Icons.home),
            title: Text('Title 1'),
            subtitle: Text('Subtitle 1'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Title 2'),
            subtitle: Text('Subtitle 2'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Title 3'),
            subtitle: Text('Subtitle 3'),
          ),
           ListTile(
            leading: Icon(Icons.home),
            title: Text('Title 1'),
            subtitle: Text('Subtitle 1'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Title 2'),
            subtitle: Text('Subtitle 2'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Title 3'),
            subtitle: Text('Subtitle 3'),
          ),
           ListTile(
            leading: Icon(Icons.home),
            title: Text('Title 1'),
            subtitle: Text('Subtitle 1'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Title 2'),
            subtitle: Text('Subtitle 2'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Title 3'),
            subtitle: Text('Subtitle 3'),
          ),
        ],
      ),
    );
  }
}
