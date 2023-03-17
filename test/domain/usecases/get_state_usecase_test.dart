import 'package:flutter_test/flutter_test.dart';

import 'package:jf_desafio/domain/domain.dart';
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
    when(() => repo()).thenAnswer((_) async => tState);
    var result = await sut();
    expect(result, isA<StateEntity>());
  });

  test('Should return the correct object', () async {
    when(() => repo()).thenAnswer((invocation) async => tState);
    var result = await sut();
    expect(result.uf, 'MG');
  });
}

class GetStateUsecase implements IGetStateUsecase {
  final IGetStateRepository repo;

  GetStateUsecase({required this.repo});
  @override
  Future<StateEntity> call() async {
    return await repo.call();
  }
}
