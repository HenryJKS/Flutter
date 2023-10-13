import 'package:expense_tracker/models/meta_dinheiro_enviado.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MetaDinheiroEnviadoRepository {
  Future cadastrarDinheiroEnviado(MetaDinheiroEnviado metaDinheiroEnviado) async {
    final supabase = Supabase.instance.client;

    await supabase.from('meta_dinheiro_enviado').insert({
      'criado_em': metaDinheiroEnviado.criadoEm.toIso8601String(),
      'valor_enviado': metaDinheiroEnviado.valorEnviado,
      'id_meta': metaDinheiroEnviado.idMeta
    });
  }

  
}