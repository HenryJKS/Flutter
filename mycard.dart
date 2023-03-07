import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myCard extends StatelessWidget {
  final IconData icone;
  final String contato;

  myCard({required this.icone, required this.contato});


  @override
  Widget build(BuildContext context) {
   
   return Card(
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
            );
   
  }
  
}