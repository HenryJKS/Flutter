import 'package:expense_tracker/pages/conta_cadastro_page.dart';
import 'package:expense_tracker/pages/home_page.dart';
import 'package:expense_tracker/pages/login_page.dart';
import 'package:expense_tracker/pages/meta_detalhes_page.dart';
import 'package:expense_tracker/pages/meta_enviar_dinheiro_page.dart';
import 'package:expense_tracker/pages/metas_cadastro_page.dart';
import 'package:expense_tracker/pages/registar_page.dart';
import 'package:expense_tracker/pages/splash_page.dart';
import 'package:expense_tracker/pages/transacao_cadastro_page.dart';
import 'package:expense_tracker/pages/transacao_detalhes_page.dart';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://visvfqesbvszpmoyzvcc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZpc3ZmcWVzYnZzenBtb3l6dmNjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY5NTYzOTksImV4cCI6MjAxMjUzMjM5OX0._To82AlOPme2XxVpnVQ6KelK2ebFfmNoMe1MQSe_Pts',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expense Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const HomePage(),
        "/splash": (context) => const SplashPage(),
        "/login": (context) => const LoginPage(),
        "/registrar": (context) => const RegistrarPage(),
        "/transacao-detalhes": (context) => const TransacaoDetalhesPage(),
        "/transacao-cadastro": (context) => const TransacaoCadastroPage(),
        "/conta-cadastro": (context) => const ContaCadastroPage(),
        "/meta-cadastro": (context) => const MetasCadastroPage(),
        "/meta-detalhes": (context) => const MetaDetalhesPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/meta-enviar-dinheiro') {
          final idMeta = settings.arguments as int;
          return MaterialPageRoute(builder: (context) => MetaEnviarDinheiro(idMeta: idMeta));
        }
        return MaterialPageRoute(builder: (context) => const HomePage());
      },
      initialRoute: "/splash",
    );
  }
}
