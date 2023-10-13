import 'package:expense_tracker/models/meta.dart';
import 'package:expense_tracker/repository/metas_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MetasCadastroPage extends StatefulWidget {
  final Meta? metaCriacao;

  const MetasCadastroPage({super.key, this.metaCriacao});

  @override
  State<MetasCadastroPage> createState() => _MetasCadastroPageState();
}

class _MetasCadastroPageState extends State<MetasCadastroPage> {
  User? user;
  final metasRepository = MetasRepository();
  final _formKey = GlobalKey<FormState>();

  final dataCriadoController = TextEditingController();
  final descricaoController = TextEditingController();
  final valorMetaController = MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.', leftSymbol: 'R\$');
  final dataMetaFinalController = TextEditingController();
  final nomeMetaController = TextEditingController();

  @override
  void initState() {
    user = Supabase.instance.client.auth.currentUser;

    final meta = widget.metaCriacao;

    if (meta != null) {
      dataCriadoController.text =
          DateFormat('MM/dd/yyyy').format(meta.criadoEm);
      descricaoController.text = meta.descricao;
      valorMetaController.text =
          NumberFormat.simpleCurrency(locale: 'pt_BR').format(meta.valorMeta);
      dataMetaFinalController.text =
          DateFormat('MM/dd/yyyy').format(meta.dataMetaFinal);
      nomeMetaController.text = meta.nomeMeta;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Metas'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _nomeMeta(),
                const SizedBox(height: 20),
                _dataCriacao(),
                const SizedBox(height: 10),
                _dataMetaFinal(),
                const SizedBox(height: 10),
                _descricaoMeta(),
                const SizedBox(height: 10),
                _valorMeta(),
                const SizedBox(height: 20),
                _buttonCriar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _dataCriacao() {
    return TextFormField(
      controller: dataCriadoController,
      keyboardType: TextInputType.none,
      decoration: const InputDecoration(
        labelText: 'Data de Criação',
        hintText: 'Informe a data de criação da meta',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.calendar_outline),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe a data de criação da meta';
        }

        try {
          DateFormat('dd/MM/yyyy').parse(value);
        } on FormatException {
          return 'Informe uma data válida';
        }
        return null;
      },
      onTap: () async {
        DateTime? dataSelecionada = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (dataSelecionada != null) {
          dataCriadoController.text =
              DateFormat('dd/MM/yyyy').format(dataSelecionada);
        }
      },
    );
  }

  TextFormField _dataMetaFinal() {
    return TextFormField(
      controller: dataMetaFinalController,
      keyboardType: TextInputType.none,
      decoration: const InputDecoration(
        labelText: 'Data da Meta Final',
        hintText: 'Informe a data da meta final',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.calendar_outline),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe a data da meta final';
        }

        try {
          DateFormat('dd/MM/yyyy').parse(value);
        } on FormatException {
          return 'Informe uma data válida';
        }
        return null;
      },
      onTap: () async {
        DateTime? dataSelecionada = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (dataSelecionada != null) {
          dataMetaFinalController.text =
              DateFormat('dd/MM/yyyy').format(dataSelecionada);
        }
      },
    );
  }

  TextFormField _descricaoMeta() {
    return TextFormField(
      controller: descricaoController,
      decoration: const InputDecoration(
        hintText: 'Descrição da meta',
        labelText: 'Descrição',
        prefixIcon: Icon(Ionicons.pencil_outline),
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.text,
      maxLines: 2,
    );
  }

  TextFormField _nomeMeta() {
    return TextFormField(
      controller: nomeMetaController,
      decoration: const InputDecoration(
        hintText: 'Meta',
        labelText: 'Nome da Meta',
        prefixIcon: Icon(Ionicons.star_outline),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe o nome da meta';
        }
        return null;
      },
    );
  }

  TextFormField _valorMeta() {
    return TextFormField(
      controller: valorMetaController,
      decoration: const InputDecoration(
        hintText: 'Valor da meta',
        labelText: 'Valor da Meta',
        prefixIcon: Icon(Ionicons.cash_outline),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe um Valor';
        }
        final valor = NumberFormat.currency(locale: 'pt_BR')
            .parse(valorMetaController.text.replaceAll('R\$', ''));
        if (valor <= 0) {
          return 'Informe um valor maior que zero';
        }

        return null;
      },
      keyboardType: TextInputType.number,
    );
  }

  SizedBox _buttonCriar() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            final dataCriacao =
                DateFormat('dd/MM/yyyy').parse(dataCriadoController.text);
            final dataMetaFinal =
                DateFormat('dd/MM/yyyy').parse(dataMetaFinalController.text);
            final valorMeta = NumberFormat.currency(locale: 'pt_BR')
                .parse(valorMetaController.text.replaceAll('R\$', ''));
            final descricao = descricaoController.text;

            final nomeMeta = nomeMetaController.text;

            final userId = user?.id ?? '';

            final meta = Meta(
                id: 0,
                userId: userId,
                criadoEm: dataCriacao,
                descricao: descricao,
                valorMeta: valorMeta.toDouble(),
                dataMetaFinal: dataMetaFinal,
                nomeMeta: nomeMeta);

            if (widget.metaCriacao == null) {
              await _cadastrarMeta(meta);
            } else {
              meta.id = widget.metaCriacao!.id;
            }
          }
        },
        child: const Text("Cadastrar Meta"),
      ),
    );
  }

  Future<void> _cadastrarMeta(Meta meta) async {
    final scaffold = ScaffoldMessenger.of(context);
    await metasRepository.cadastrarMeta(meta).then(
      (_) {
        scaffold.showSnackBar(const SnackBar(
          content: Text("Meta cadastrada com sucesso!"),
        ));
        Navigator.of(context).pop(true);
      },
    ).catchError((error) {
      scaffold.showSnackBar(SnackBar(
        content: Text("Erro ao cadastrar meta: ${error.toString()}"),
      ));
      Navigator.of(context).pop(false);
    });
  }
}
