import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/domain.dart';

part 'get_city_event.dart';
part 'get_city_state.dart';

class GetCityBloc {
  final IGetCityUsecase cityUsecase;

  final _inputCityController = StreamController<GetCityEvent>();
  final _outputCityController = StreamController<GetCityState>();

  Sink<GetCityEvent> get inputRegister => _inputCityController.sink;
  Stream<GetCityState> get outputRegister =>
      _outputCityController.stream.asBroadcastStream();

  GetCityBloc(this.cityUsecase) {
    _inputCityController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(GetCityEvent event) async {
    var cities = <CityEntity>[];
    _outputCityController.add(GetCityLoading());
    //print(event.toString());

    if (event is GetCities) {
      cities = await cityUsecase.call(id: event.id);
    }
    _outputCityController.add(GetCitySuccess(cities: cities));
  }
}
