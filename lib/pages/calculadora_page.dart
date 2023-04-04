import 'package:flutter/material.dart';
import 'package:projeto/componets/custom_card.dart';
import 'package:projeto/componets/icon_content.dart';
import 'package:projeto/constant.dart';

class CalculadoraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate IMC'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    child: IconContent(
                      data: Icons.male,
                      text: 'Masculino',
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    child: IconContent(
                      data: Icons.female,
                      text: 'Feminino',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Altura',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '1.83',
                              style: kNumberTextStyle,
                            ),
                            Text('cm'),
                          ],
                        ),
                        Slider(value: 0, onChanged: (double value) {})
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    child: Placeholder(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
