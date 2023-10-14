import 'package:expense_tracker/models/meta.dart';
import 'package:expense_tracker/repository/metas_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class MetaDetalhesPage extends StatefulWidget {
  const MetaDetalhesPage({super.key});

  @override
  State<MetaDetalhesPage> createState() => _MetaDetalhesPageState();
}

class _MetaDetalhesPageState extends State<MetaDetalhesPage> {
  double? dinheiroAtual = 10;
  final metaRepository = MetasRepository();


  @override
  Widget build(BuildContext context) {
    final meta = ModalRoute.of(context)!.settings.arguments as Meta;
    metaRepository.dinheiroPorId(meta.id).then((value) {
      setState(() {
        dinheiroAtual = value;
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(meta.nomeMeta),
        backgroundColor: const Color(0xFFB39DDB),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/meta-enviar-dinheiro',
                        arguments: meta.id);
                  },
                  child: const Text('Enviar Dinheiro'),
                ),
              ],
            ),
            ListTile(
              title: const Text('Meta Desejado'),
              subtitle: Text(meta.nomeMeta),
            ),
            ListTile(
              title: const Text('Data de Criação da Meta'),
              subtitle: Text(DateFormat('dd/MM/yyyy').format(meta.criadoEm)),
            ),
            ListTile(
              title: const Text('Data de Finalização da Meta'),
              subtitle:
                  Text(DateFormat('dd/MM/yyyy').format(meta.dataMetaFinal)),
            ),
            ListTile(
              title: const Text('Descrição da Meta'),
              subtitle: Text(meta.descricao.isEmpty ? '-' : meta.descricao),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: const Text('Valor da Meta'),
                    subtitle: Text(
                      NumberFormat.simpleCurrency(locale: 'pt_BR')
                          .format(meta.valorMeta),
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: const Text('Valor Atual'),
                    subtitle: Text(
                        NumberFormat.simpleCurrency(locale: 'pt_BR')
                            .format(dinheiroAtual ?? 0),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.blue)),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Text('Progresso da meta'),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height:
                  30,
              child: LinearProgressIndicator(
                value: (dinheiroAtual ?? 0) / meta.valorMeta,
                backgroundColor: Colors.grey,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
