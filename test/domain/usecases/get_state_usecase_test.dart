import 'package:flutter_test/flutter_test.dart';

import 'package:jf_desafio/features/register/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class MockGetStateRepo extends Mock implements IGetStateRepository {}

void main() {
  late IGetStateUsecase sut;
  late IGetStateRepository repo;
  late StateEntity tState;

  setUp(() {
    repo = MockGetStateRepo();
    sut = GetStateUsecase(repo: repo);
    tState = StateEntity(id: 1, name: 'Minas Gerais', uf: 'MG');
  });

  test('Should return the correct object type', () async {
    when(() => repo()).thenAnswer((_) async => [tState]);
    var result = await sut();
    expect(result, isA<List<StateEntity>>());
  });

  test('Should return the correct instance', () async {
    when(() => repo()).thenAnswer((invocation) async => [tState]);
    var result = await sut();
    expect(result.first.uf, 'MG');
  });
}


