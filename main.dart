import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meuprojeto/mycard.dart';

void main() {
  runApp(MaterialApp(
    home: myApp(),
  ));
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('../images/R.jpg'),
              radius: 50,
            ),
            Text(
              'Bob',
              style: TextStyle(
                fontFamily: 'TiltWarp-Regular-VariableFont_XROT,YROT',
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                fontFamily: 'TiltWarp-Regular-VariableFont_XROT,YROT',
                color: Colors.lightGreen,
                fontSize: 18,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.phone),
                    Text(
                      '+55 1199585851',
                      style: TextStyle(color: Colors.lightBlue,
                      fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
            myCard(icone: Icons.phone, contato: '+55 11 983282382'),
            myCard(icone: Icons.email, contato: 'abcdfe@gmail.com'),
          ],
        ),
      ),
    );
  }
}
