import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:jf_desafio/data/data.dart';
import 'package:jf_desafio/domain/domain.dart';

class MockDatasource extends Mock implements IGetCityDatasource {}

void main() {
  late IGetCityRepository sut;
  late IGetCityDatasource datasource;
  late CityModel tModel;
  setUp(() {
    datasource = MockDatasource();
    sut = GetCityRepository(datasource: datasource);
    tModel = CityModel(nome: 'testCity');
  });

  test('Should return a CityEntity when called', () async {
    when(() => datasource.call(id:any(named: 'id'))).thenAnswer((invocation) async => [tModel] );
    var result = await sut.call(id: 5);
    verify(() => datasource(id:5)).called(1);
    expect(result, isA<List<CityEntity>>());
  });

  test('Should return the correct object when called', () async {
    when(() => datasource.call(id:any(named: 'id'))).thenAnswer((invocation) async => [tModel]);
    var result = await sut.call(id:5);
    expect(result.first.name, 'testCity');
  });
}

