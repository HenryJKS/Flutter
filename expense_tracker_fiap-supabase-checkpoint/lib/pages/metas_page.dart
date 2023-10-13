import 'package:expense_tracker/models/meta.dart';
import 'package:expense_tracker/repository/metas_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MetasPage extends StatefulWidget {
  const MetasPage({super.key});

  @override
  State<MetasPage> createState() => _MetasPageState();
}

class _MetasPageState extends State<MetasPage> {
  final metasRepository = MetasRepository();
  late Future<List<Meta>> futureMetas;
  User? user;
  String userId = Supabase.instance.client.auth.currentUser!.id;

  @override
  void initState() {
    user = Supabase.instance.client.auth.currentUser;
    print(userId);
    futureMetas = metasRepository.listarMetas(userId);

    futureMetas.then((value) => print(value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metas'),
      ),
      body: FutureBuilder<List<Meta>>(
          future: futureMetas,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator(),
              );
            } else if(snapshot.hasError) {
              return const Center(child: Text('Erro ao carregar as metas'),);
            } else if(!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Nenhuma Meta Cadastrada'),);
            } else {
              final metas = snapshot.data!;
              return ListView.separated(itemCount: metas.length,
              itemBuilder: (context, index) {
                final meta = metas[index];
                return ListTile(
                  leading: const Icon(Icons.shopping_bag, color: Colors.lightBlueAccent, size: 30),
                  title: Text(meta.nomeMeta),
                  subtitle: Text(DateFormat('dd/MM/yyyy').format(meta.dataMetaFinal)),
                  trailing: Text(
                    NumberFormat.simpleCurrency(locale: 'pt_BR').format(meta.valorMeta),
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.green
                    ),
                    ),
                  onTap: () {
                    Navigator.pushNamed(context, '/meta-detalhes',
                    arguments: meta);
                  },
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              );
            }
          },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "meta-cadastro",
        onPressed: () {
          Navigator.pushNamed(context, '/meta-cadastro');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
