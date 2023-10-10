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

  @override
  void initState() {
    user = Supabase.instance.client.auth.currentUser;
    final trasancaorepo = await TransacoesReepository().somarTransacao(userId: user?.id ?? '');
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Receitas x Despesas'),
        ),
        drawer: const UserDrawer(),
        // criar um corpo mostrando um grafico de pizza
        body: Center(
          child: PieChart(dataMap:),
        ));
  }
}
