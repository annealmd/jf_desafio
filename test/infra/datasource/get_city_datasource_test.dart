import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:jf_desafio/features/register/data/data.dart';
import 'package:jf_desafio/features/register/infra/infra.dart';

import '../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late IGetCityDatasource sut;
  late IHttpClient client;
  late HttpResponse response;

  setUp(() {
    client = MockHttpClient();
    sut = GetCityDatasource(client: client);
    response = HttpResponse(body: fixture('cities.json'), statusCode: 200);
  });
  test('Should return a List<CityModel> when called', () async {
    when(() => client.getCity(id: any(named: 'id')))
        .thenAnswer((invocation) async => response);
    final result = await sut.call(id: 5);

    verify(() => client.getCity(id: 5)).called(1);
    expect(result, isA<List<CityModel>>());
  });

  test('Should return the correct instance', () async {
    when(() => client.getCity(id: any(named: 'id')))
        .thenAnswer((invocation) async => response);
    final result = await sut(id: 5);
    expect(result.first.name, 'test1');
  });
}
