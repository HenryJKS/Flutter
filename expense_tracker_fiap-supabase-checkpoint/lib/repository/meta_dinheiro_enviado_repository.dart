import 'package:expense_tracker/models/meta_dinheiro_enviado.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MetaDinheiroEnviadoRepository {
  Future cadastrarDinheiroEnviado(MetaDinheiroEnviado metaDinheiroEnviado) async {
    final supabase = Supabase.instance.client;

    await supabase.from('meu_dinheiro_enviado').insert({
      'valor_enviado': metaDinheiroEnviado.valorEnviado,
      'id_meta': metaDinheiroEnviado.idMeta
    });
  }

  
}