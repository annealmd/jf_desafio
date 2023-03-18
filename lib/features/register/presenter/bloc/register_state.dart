part of 'register_bloc.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class GetStateSuccess extends RegisterState {
  final List<StateEntity> states;

  GetStateSuccess({required this.states});
}

class GetCitySuccess extends RegisterState {
  final List<CityEntity> cities;

  GetCitySuccess(this.cities);
}

class RegisterError extends RegisterState {}
