import 'package:expense_tracker/components/conta_item.dart';
import 'package:expense_tracker/models/conta.dart';
import 'package:flutter/material.dart';

import '../repository/contas_repositrory.dart';

class ContasPage extends StatefulWidget {
  const ContasPage({super.key});

  @override
  State<ContasPage> createState() => _ContasPageState();
}

class _ContasPageState extends State<ContasPage> {
  final futurecontas = ContasRepository().listarContas();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Conta>>(
        future: futurecontas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhuma conta cadastrada'));
          } else {
            final contas = snapshot.data!;
            return ListView.separated(
              itemCount: contas.length,
              itemBuilder: (context, index) {
                final conta = contas[index];
                return ContaItem(conta: conta);
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
        });
  }
}
