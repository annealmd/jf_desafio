part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {}

class RegisterInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

class GetStateSuccess extends RegisterState {
  final List<StateEntity> states;

  GetStateSuccess({required this.states});

  @override
  List<Object?> get props => [states];
}

class GetCitySuccess extends RegisterState {
  final List<CityEntity> cities;

  GetCitySuccess({required this.cities});

  @override
  List<Object?> get props => [cities];
}

class RegisterError extends RegisterState {
  final String message;

  RegisterError({required this.message});
  @override
  List<Object?> get props => [message];
}
