import 'dart:convert';

import '../../data/data.dart';

class GetStateDatasource implements IGetStateDatasource {
  final IHttpClient client;

  GetStateDatasource({required this.client});
  @override
  Future<List<StateModel>> call() async {
    final response = await client.getState();
    if (response.statusCode == 200) {
      final list = jsonDecode(response.body) as List;
      return list.map((e) => StateModel.fromJson(e)).toList();
    } else {
      throw Exception('Error ${response.statusCode}');
    }
  }
}
