import 'package:expense_tracker/components/user_drawer.dart';
import 'package:expense_tracker/repository/transacoes_repository.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});
  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  User? user;
  final transacoesRepository = TransacoesReepository();

  @override
  void initState() {
    user = Supabase.instance.client.auth.currentUser;
    final sumTransacoes = transacoesRepository.somarTransacao(user);
    super.initState();

    sumTransacoes.then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Receitas x Despesas'),
        ),
        drawer: const UserDrawer(),
        body: const Center(
          child: PieChart(dataMap: 
          {
            "Receitas": 1000,
            "Despesas": 500,
          },),
        ));
  }
}
