import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:jf_desafio/data/data.dart';
import 'package:jf_desafio/infra/infra.dart';

import '../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late IGetStateDatasource sut;
  late IHttpClient client;
  late HttpResponse response;

  setUp(() {
    client = MockHttpClient();
    sut = GetStateDataSource(client: client);
    response = HttpResponse(body: fixture('states.json'), statusCode: 200);
  });

  test('Should return a List<StateModel> when called', () async {
    when(() => client.getState()).thenAnswer((invocation) async => response);

    final result = await sut.call();
    verify(() => client.getState()).called(1);
    expect(result, isA<List<StateModel>>());
  });
  test('Should return the correct instance', () async {
    when(() => client.getState()).thenAnswer((invocation) async => response);
    final result = await sut();
    expect(result.first.name, 'Acre');
  });
}
