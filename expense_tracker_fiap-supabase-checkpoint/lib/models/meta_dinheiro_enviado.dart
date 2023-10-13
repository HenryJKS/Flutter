class MetaDinheiroEnviado {
  DateTime criadoEm;
  double valorEnviado;
  int idMeta;

  MetaDinheiroEnviado(
      {
      required this.criadoEm,
      required this.valorEnviado,
      required this.idMeta
      });

  factory MetaDinheiroEnviado.fromMap(Map<String, dynamic> map) {
    return MetaDinheiroEnviado(
      criadoEm: DateTime.parse(map['criado_em']),
      valorEnviado: map['valor_enviado'],
      idMeta: map['id_meta'],
    );
  }

  
}