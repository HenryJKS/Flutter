class MetaDinheiroEnviado {
  final int id;
  final DateTime criadoEm;
  final double valorEnviado;
  final int idMeta;

  MetaDinheiroEnviado(
      {required this.id,
      required this.criadoEm,
      required this.valorEnviado,
      required this.idMeta
      });

  factory MetaDinheiroEnviado.fromMap(Map<String, dynamic> map) {
    return MetaDinheiroEnviado(
      id: map['id'],
      criadoEm: DateTime.parse(map['criado_em']),
      valorEnviado: map['valor_enviado'],
      idMeta: map['id_meta'],
    );
  }

  
}