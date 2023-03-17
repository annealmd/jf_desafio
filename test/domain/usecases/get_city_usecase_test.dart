import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:jf_desafio/domain/domain.dart';

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
    when(() => repo()).thenAnswer((invocation) async => tCity);
    var result = await sut();
    expect(result, isA<CityEntity>());
  });
  test('Should return the correct object', () async {
    when(() => repo()).thenAnswer((invocation) async => tCity);
    var result = await sut();
    expect(result.name, 'Montes Claros');
  });
}

