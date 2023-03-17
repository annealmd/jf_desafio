import 'package:flutter_test/flutter_test.dart';
import 'package:jf_desafio/data/data.dart';
import 'package:jf_desafio/domain/domain.dart';
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

  test('Should return a StateEntity when called', () async {
    when(() => datasource()).thenAnswer((invocation) async => [tModel]);
    var result = await sut.call();
    verify(() => datasource()).called(1);
    expect(result, isA<List<StateEntity>>());
  });

  test('Should return the correct object when called', () async {
    when(() => datasource.call()).thenAnswer((invocation) async => [tModel]);
    var result = await sut.call();
    expect(result.first.uf, 'TS');
  });
}

class GetStateRepository implements IGetStateRepository {
  final IGetStateDatasource datasource;

  GetStateRepository({required this.datasource});
  @override
  Future<List<StateEntity>> call() {
    return datasource.call();
  }
}

abstract class IGetStateDatasource {
  Future<List<StateModel>> call();
}
