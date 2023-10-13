import 'package:expense_tracker/models/meta_dinheiro_enviado.dart';
import 'package:expense_tracker/repository/meta_dinheiro_enviado_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class MetaEnviarDinheiro extends StatefulWidget {
  final int idMeta;

  final MetaDinheiroEnviado? metaDinheiroEnviadoCriacao;

  const MetaEnviarDinheiro({super.key, this.metaDinheiroEnviadoCriacao, required this.idMeta});

  @override
  State<MetaEnviarDinheiro> createState() => _MetaEnviarDinheiroState();
}

class _MetaEnviarDinheiroState extends State<MetaEnviarDinheiro> {
  final metaDinheiroEnviadoRepository = MetaDinheiroEnviadoRepository();
  final _formKey = GlobalKey<FormState>();

  final valorEnviarMetaController = MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.', leftSymbol: 'R\$');

  @override
  void initState() {
    final metaCriacao = widget.metaDinheiroEnviadoCriacao;

    if (metaCriacao != null) {
      valorEnviarMetaController.text =
          NumberFormat.simpleCurrency(locale: 'pt_BR')
              .format(metaCriacao.valorEnviado);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enviar Dinheiro para Meta')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _valorEnviarMeta(),
                const SizedBox(height: 8),
                _buttonEnviar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buttonEnviar() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            final valorEnviado = NumberFormat.currency(locale: 'pt_BR')
              .parse(valorEnviarMetaController.text.replaceAll('R\$', ''));

            // final metaId = metaEnviar.idMeta;

            final metaEnviarDinheiro = MetaDinheiroEnviado(
              criadoEm: DateTime.now(),
              valorEnviado: valorEnviado.toDouble(),
              idMeta: widget.idMeta
            );

            if (widget.metaDinheiroEnviadoCriacao == null) {
              await _cadastrarDinheiroMeta(metaEnviarDinheiro);
            } else {
            }
          }
        },
        child: const Text('Enviar Dinheiro'),
      ),
    );
  }

  TextFormField _valorEnviarMeta() {
    return TextFormField(
      controller: valorEnviarMetaController,
      decoration: const InputDecoration(
        hintText: 'Valor para meta',
        labelText: 'Valor a ser enviado',
        prefixIcon: Icon(Ionicons.cash_outline),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Informe o valor";
        }
        final valor = NumberFormat.currency(locale: 'pt_BR')
            .parse(valorEnviarMetaController.text.replaceAll('R\$', ''));
        if (valor <= 0) {
          return 'Informe um valor maior que zero';
        }

        return null;
      },
      keyboardType: TextInputType.number,
    );
  }

  Future<void> _cadastrarDinheiroMeta(
      MetaDinheiroEnviado metaDinheiroEnviado) async {
    final scaffold = ScaffoldMessenger.of(context);
    await metaDinheiroEnviadoRepository
        .cadastrarDinheiroEnviado(metaDinheiroEnviado)
        .then(
      (_) {
        scaffold.showSnackBar(const SnackBar(
          content: Text('Dinheiro enviado para meta com sucesso!'),
        ));
        Navigator.of(context).pop(true);
      },
    ).catchError(
      (error) {
        scaffold.showSnackBar(SnackBar(
          content: Text('Erro ao enviar dinheiro para meta! ${error.toString()}}'),
        ));
        Navigator.of(context).pop(false);
      },
    );
  }
}
