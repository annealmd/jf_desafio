import 'package:flutter_test/flutter_test.dart';
import 'package:jf_desafio/features/register/data/data.dart';
import 'package:jf_desafio/features/register/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class MockGetDatasource extends Mock implements IGetStateDatasource {}

void main() {
  late IGetStateRepository sut;
  late IGetStateDatasource datasource;
  late StateModel tModel;
  setUp(() {
    datasource = MockGetDatasource();
    sut = GetStateRepository(datasource: datasource);
    tModel = StateModel(id: 1, nome: 'testState', sigla: 'TS');
  });

  test('Should return a List<StateEntity> when called', () async {
    when(() => datasource()).thenAnswer((invocation) async => [tModel]);
    var result = await sut.call();
    verify(() => datasource()).called(1);
    expect(result, isA<List<StateEntity>>());
  });

  test('Should return the correct instance when called', () async {
    when(() => datasource.call()).thenAnswer((invocation) async => [tModel]);
    var result = await sut.call();
    expect(result.first.uf, 'TS');
  });
}

