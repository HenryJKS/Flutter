class Meta {
    int id;
    String userId;
    DateTime criadoEm;
    String descricao = '';
    double valorMeta;
    DateTime dataMetaFinal;
    String nomeMeta;

    Meta({
        required this.id,
        required this.userId,
        required this.criadoEm,
        this.descricao = '',
        required this.valorMeta,
        required this.dataMetaFinal,
        required this.nomeMeta,
    });

    factory Meta.fromMap(Map<String, dynamic> map) {
      return Meta(
        id: map['id'],
        userId: map['user_id'],
        criadoEm: DateTime.parse(map['criado_em']),
        descricao: map['descricao'] ?? '',
        valorMeta: map['valor_meta'],
        dataMetaFinal: DateTime.parse(map['data_meta_final']),
        nomeMeta: map['nome_meta'],
      );
    }
}