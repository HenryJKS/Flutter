import 'package:expense_tracker/models/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MetasRepository {
  Future<List<Meta>> listarMetas(String userId) async {
    final supabase = Supabase.instance.client;

    var query = supabase.from('metas')
    .select<List<Map<String, dynamic>>>('*')
    .eq('user_id', userId);

    var data = await query;

    final list = data.map((map) {
      return Meta.fromMap(map);
    }).toList();

    return list;
  }

  Future cadastrarMeta(Meta meta) async {
    final supabase = Supabase.instance.client;

    await supabase.from("metas").insert({
      'user_id': meta.userId,
      'criado_em': meta.criadoEm.toIso8601String(),
      'descricao': meta.descricao,
      'valor_meta': meta.valorMeta,
      'data_meta_final': meta.dataMetaFinal.toIso8601String(),
      'nome_meta': meta.nomeMeta,
    });
  }

  Future alterarMeta(Meta meta) async {
    final supabase = Supabase.instance.client;

    await supabase.from('metas').update({
      'descricao': meta.descricao,
      'valor': meta.valorMeta,
      'data_meta_final': meta.dataMetaFinal.toIso8601String(),
      'nome_meta': meta.nomeMeta,
    }).match({'id': meta.id});
  }

  Future excluirMeta(Meta meta) async {
    final supabase = Supabase.instance.client;

    await supabase.from('metas').delete().match({'id': meta.id});
  }

  Future dinheiroPorId(int metaId) async {
    final supabase = Supabase.instance.client;

    final dinheiroPorId = await supabase.rpc('valor_enviado_id', params: {'id': metaId});

    return dinheiroPorId;
  }

  
}