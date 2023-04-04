import 'package:flutter/material.dart';
import 'package:projeto/constant.dart';

class IconContent extends StatelessWidget {
  final IconData data;
  final String text;

  const IconContent({
    Key? key,
      required this.data,
      required this.text

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          data,
          size: 80.0,
        ),
        SizedBox(height: 10.0
        ),
        Text(
          text,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}