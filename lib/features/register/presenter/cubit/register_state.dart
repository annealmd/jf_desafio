part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterLoading extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterGetStatesSuccess extends RegisterState {
  final List<StateEntity> states;

  const RegisterGetStatesSuccess({required this.states});

  @override
  List<Object?> get props => [states];
}

class RegisterGetCitiesSuccess extends RegisterState {
  final List<CityEntity> cities;

  const RegisterGetCitiesSuccess({required this.cities});

  @override
  List<Object?> get props => [cities];
}

class RegisterError extends RegisterState {
  final String message;

  const RegisterError({required this.message});

  @override
  List<Object?> get props => [message];
}
