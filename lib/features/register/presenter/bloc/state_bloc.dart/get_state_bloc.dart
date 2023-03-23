//import 'package:bloc/bloc.dart';
import 'dart:async';

import 'package:equatable/equatable.dart';

import '../../../domain/domain.dart';

part 'get_state_event.dart';
part 'get_state_state.dart';

class GetStateBloc {
  final IGetStateUsecase stateUsecase;

  final _inputGetStateController = StreamController<GetStateEvent>();
  final _outputGetStateController = StreamController<GetStateState>();

  Sink<GetStateEvent> get inputGetState => _inputGetStateController.sink;
  Stream<GetStateState> get outputGetState => _outputGetStateController.stream;

  GetStateBloc({required this.stateUsecase}) {
    _inputGetStateController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(GetStateEvent event) async {
    var states = <StateEntity>[];
    _outputGetStateController.add(GetStateLoading());

    try {
      if (event is GetStates) {
        states = await stateUsecase.call();
      }
      _outputGetStateController.add(GetStateSuccess(states: states));
    } on Exception catch (e) {
      _outputGetStateController
          .add(GetStateError(message: 'Servidor com problemas $e'));
    }
  }
}
