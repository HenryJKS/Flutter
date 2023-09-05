import 'dart:async';
import 'dart:ui';

import 'package:expense_tracker/models/tipo_transacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class TransacaoCadastro extends StatefulWidget {
  const TransacaoCadastro({super.key});

  @override
  State<TransacaoCadastro> createState() => _TransacaoCadastroState();
}

class _TransacaoCadastroState extends State<TransacaoCadastro> {
  final _key = GlobalKey<FormState>();
  final descricaoController = TextEditingController();
  final valorController = MoneyMaskedTextController();
  final dataController = TextEditingController();

  var tipoTransacaoSelecionada = TipoTransacao.receita;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova Transação')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _key,
          child: Column(
            children: [
              _buildDescricao(),
              SizedBox(
                height: 30,
              ),
              _buildTipoTransacao(),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                child: _buildValor(),
              ),
              SizedBox(
                height: 30,
              ),
              _buildData(),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: _buildButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildDescricao() {
    return TextFormField(
      controller: descricaoController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Descrição Obrigatória';
        }
        return null;
      },
      decoration: InputDecoration(
        label: Text('Descrição'),
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.text_outline),
      ),
    );
  }

  ElevatedButton _buildButton() {
    return ElevatedButton(
        onPressed: () {
          final valido = _key.currentState!.validate();
          if (valido) {
            print(descricaoController.text);
          }
        },
        child: const Text("Cadastrar Transação"));
  }

  TextFormField _buildValor() {
    return TextFormField(
      controller: valorController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Valor Obrigatório';
        }
        return null;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        label: Text('Valor'),
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.cash_outline),
      ),
    );
  }

  TextFormField _buildData() {
    return TextFormField(
      controller: dataController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Data Obrigatório';
        }
        return null;
      },
      onTap: () async {
        DateTime? dataSelecionada = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100));

        if (dataSelecionada != null)
          dataController.text =
              DateFormat('dd/MM/yyyy').format(dataSelecionada);
      },
      keyboardType: TextInputType.none,
      decoration: InputDecoration(
        label: Text('Data'),
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.calendar_clear_outline),
      ),
    );
  }

  DropdownMenu<TipoTransacao> _buildTipoTransacao() {
    return DropdownMenu(
      width: MediaQuery.of(context).size.width - 16,
      initialSelection: tipoTransacaoSelecionada,
      dropdownMenuEntries: [
        DropdownMenuEntry(value: TipoTransacao.receita, label: "Receita"),
        DropdownMenuEntry(value: TipoTransacao.despesa, label: "Despesa"),
      ],
    );
  }
}
