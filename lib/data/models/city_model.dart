import 'package:jf_desafio/domain/domain.dart';

class CityModel extends CityEntity {
  CityModel({required nome}) : super(name: nome);

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(nome: json['nome']);
  }

  Map<String, dynamic> toJson() {
    return {'nome': name};
  }
}
