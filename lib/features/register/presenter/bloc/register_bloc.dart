//import 'package:bloc/bloc.dart';
import 'dart:async';

import 'package:equatable/equatable.dart';

import '../../domain/domain.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc {
  final IGetStateUsecase stateUsecase;

  final _inputRegisterController = StreamController<RegisterEvent>();
  final _outputRegisterController = StreamController<RegisterState>();

  Sink<RegisterEvent> get inputRegister => _inputRegisterController.sink;
  Stream<RegisterState> get outputRegister => _outputRegisterController.stream;

  RegisterBloc({required this.stateUsecase}) {
    _inputRegisterController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(RegisterEvent event) async {
    var states = <StateEntity>[];
    _outputRegisterController.add(RegisterLoading());

    try {
      if (event is GetStateEvent) {
        states = await stateUsecase.call();
      }
      _outputRegisterController.add(GetStateSuccess(states: states));
    } on Exception catch (e) {
      _outputRegisterController
          .add(RegisterError(message: 'Servidor com problemas $e'));
    }
  }
}
