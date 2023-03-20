part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  final List<StateEntity> statesList;
  final List<CityEntity> citiesList;

  const RegisterState(this.statesList, this.citiesList);

  @override
  List<Object?> get props => [statesList, citiesList];
}

class RegisterInitial extends RegisterState {
  RegisterInitial() : super([], []);

  @override
  List<Object?> get props => [statesList, citiesList];
}

class RegisterLoading extends RegisterState {
  RegisterLoading() : super([], []);

  @override
  List<Object?> get props => [statesList, citiesList];
}

class GetStateSuccess extends RegisterState {
  final List<StateEntity> states;

  GetStateSuccess({required this.states}) : super(states, []);

  @override
  List<Object?> get props => [statesList, citiesList];
}

class GetCitySuccess extends RegisterState {
  final List<CityEntity> cities;

  GetCitySuccess({required this.cities}) : super([], cities);

  @override
  List<Object?> get props => [statesList, citiesList];
}

class RegisterError extends RegisterState {
  final String message;

  RegisterError({required this.message}) : super([], []);
  @override
  List<Object?> get props => [message];
}
