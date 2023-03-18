import 'dart:convert';

import '../../data/data.dart';

class GetCityDatasource implements IGetCityDatasource {
  final IHttpClient client;

  GetCityDatasource({required this.client});

  @override
  Future<List<CityModel>> call({required int id}) async {
    final response = await client.getCity(id: id);
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;
      return list.map((e) => CityModel.fromJson(e)).toList();
    } else {
      throw Exception('Error ${response.statusCode}');
    }
  }
}
