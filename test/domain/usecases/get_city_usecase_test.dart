import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:jf_desafio/features/register/domain/domain.dart';

class MockGetCityRepo extends Mock implements IGetCityRepository {}

void main() {
  late IGetCityUsecase sut;
  late IGetCityRepository repo;
  late CityEntity tCity;
  setUp(() {
    repo = MockGetCityRepo();
    sut = GetCityUsecase(repo: repo);    
    tCity = CityEntity(name: 'Montes Claros');
  });
  test('Should return the correct object type', () async {
    when(() => repo(id:any(named: 'id'))).thenAnswer((invocation) async => [tCity]);
    var result = await sut(id: 5);
    expect(result, isA<List<CityEntity>>());
  });
  test('Should return the correct instance', () async {
    when(() => repo(id:any(named: 'id'))).thenAnswer((invocation) async => [tCity]);
    var result = await sut(id: 5);
    expect(result.first.name, 'Montes Claros');
  });
}

