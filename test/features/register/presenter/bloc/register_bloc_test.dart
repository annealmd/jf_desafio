import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:jf_desafio/features/register/domain/domain.dart';
import 'package:jf_desafio/features/register/presenter/presenter.dart';

class MockRegisterBloc extends MockBloc<RegisterEvent, RegisterState>
    implements RegisterBloc {}

void main() {
  late RegisterBloc bloc;
  late StateEntity tState;
  late CityEntity tCity;

  setUp(() {
    bloc = MockRegisterBloc();
    tState = StateEntity(id: 1, name: 'Minas Gerais', uf: 'MG');
    tCity = CityEntity(name: 'Montes Claros');
  });
  group('GetState test', () {
    test("Let's mock the RegisterBloc's stream!", () {
    whenListen(
        bloc,
        Stream.fromIterable([
          RegisterInitial(),
          GetStateSuccess(states: [tState])
        ]));
    expectLater(
        bloc.stream,
        emitsInOrder(<RegisterState>[
          RegisterInitial(),
          GetStateSuccess(states: [tState])
        ]));
  });
  });

  group('RegisterBloc', () {
    blocTest<RegisterBloc, RegisterState>(
      'emits [] when nothing is added',
      build: () => bloc,
      expect: () => const <RegisterState>[],
    );
  //    blocTest<RegisterBloc, RegisterState>(
  //   'emits GetStateSuccess(states: [tState]) when GetStateEvent() is added',
  //   build: () => bloc,
  //   act: (bloc) => bloc.add(GetStateEvent()),
  //   expect: () => <RegisterState>[
  //     GetStateSuccess(states: [tState])
  //   ],
  // );
  });

 
  

  group('GetState test', () {
    test("Let's mock the RegisterBloc's stream!", () {
    whenListen(
        bloc,
        Stream.fromIterable([
          RegisterInitial(),
          GetCitySuccess(cities: [tCity])
        ]));
    expectLater(
        bloc.stream,
        emitsInOrder(<RegisterState>[
          RegisterInitial(),
          GetCitySuccess(cities: [tCity])
        ]));
  });

  group('RegisterBloc', () {
    blocTest<RegisterBloc, RegisterState>(
      'emits [] when nothing is added',
      build: () => bloc,
      expect: () => const <RegisterState>[],
    );
  });

  // blocTest<RegisterBloc, RegisterState>(
  //   'emits GetStateSuccess(states: [tState]) when GetStateEvent() is added',
  //   build: () => bloc,
  //   act: (bloc) => bloc.add(GetStateEvent()),
  //   expect: () => [isA<RegisterState>()],
    // expect: () => <RegisterState>[
    //   GetStateSuccess(states: [tState])
   // ],
  // );
  });
  
}
