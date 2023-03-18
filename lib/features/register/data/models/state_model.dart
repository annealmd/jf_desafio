import 'package:jf_desafio/features/register/domain/domain.dart';

class StateModel extends StateEntity {
  StateModel({required id, required nome, required sigla})
      : super(
          id: id,
          name: nome,
          uf: sigla,
        );

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['id'],
      nome: json['nome'],
      sigla: json['sigla'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'nome': name, 'sigla': uf};
  }
}
