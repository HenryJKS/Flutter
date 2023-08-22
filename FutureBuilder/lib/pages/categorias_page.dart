import 'package:expense_tracker/models/categoria.dart';
import 'package:expense_tracker/repository/categoria_repository.dart';
import 'package:flutter/material.dart';

import '../components/categoria_Item.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage({super.key});

  @override
  State<CategoriasPage> createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  final futureCategorias = CategoriaRepository().listarCategorias();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categorias'),
        ),
        body: FutureBuilder<List<Categoria>>(
            future: futureCategorias,
            builder: (context, snapshot) {
              // Verificando a conexão
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
                // Verificando se retornar um erro
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
                // Verificando se não retornou dados
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(
                    child: Text('Nenhuma categoria cadastrada'));
              } else {
                final categorias = snapshot.data!;
                return ListView.separated(
                  itemCount: categorias.length,
                  itemBuilder: (context, index) {
                    final categoria = categorias[index];
                    return CategoriaItem(categoria: categoria);
                  },
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                );
              }
            }));
  }
}
