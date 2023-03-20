//import 'package:bloc/bloc.dart';
import 'dart:async';

import 'package:equatable/equatable.dart';

import 'package:jf_desafio/features/register/domain/domain.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc {
  final IGetCityUsecase cityUsecase;
  final IGetStateUsecase stateUsecase;

  final _inputRegisterController = StreamController<RegisterEvent>();
  final _outputRegisterController = StreamController<RegisterState>();

  Sink<RegisterEvent> get inputRegister => _inputRegisterController.sink;
  Stream<RegisterState> get outputRegister =>
      _outputRegisterController.stream.asBroadcastStream();

  RegisterBloc({required this.cityUsecase, required this.stateUsecase}) {
    _inputRegisterController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(RegisterEvent event) async {
    var states = <StateEntity>[];
    //var cities = <CityEntity>[];
    _outputRegisterController.add(RegisterLoading());
    //print(event.toString());

    if (event is GetStateEvent) {
      states = await stateUsecase.call();
    }
    // if (event is GetCityEvent) {
    //   cities = await cityUsecase.call(id: event.id);
    //   _outputRegisterController.add(GetCitySuccess(cities: cities));
    // }
    _outputRegisterController.add(GetStateSuccess(states: states));
  }
}
