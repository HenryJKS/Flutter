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
  double? despesas;
  double? receitas;
  final transacoesRepository = TransacoesReepository();

  @override
  void initState() {
    super.initState();

    String user = Supabase.instance.client.auth.currentUser!.id;

    transacoesRepository.somarDespesa(user).then((value) {
      setState(() {
        despesas = value;
      });
    });

    transacoesRepository.somarReceita(user).then((value) {
      setState(() {
        receitas = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Receitas x Despesas'),
        ),
        drawer: UserDrawer(),
        body: Center(
          child: PieChart(
            dataMap: {
              "Receitas": receitas ?? 0,
              "Despesas": despesas ?? 0,
            },
            animationDuration: const Duration(seconds: 1),
            colorList: const [
              Colors.blue,
              Colors.red,
            ],
            legendOptions: const LegendOptions(
                legendTextStyle: TextStyle(fontWeight: FontWeight.bold)),
            chartValuesOptions: const ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              decimalPlaces: 2,
            ),
          ),
        ));
  }
}
