part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterLoading extends RegisterState {}

class RegisterGetStatesSuccess extends RegisterState {
  final List<StateEntity> states;

  const RegisterGetStatesSuccess({required this.states});
}

class RegisterGetCitiesSuccess extends RegisterState {
  final List<CityEntity> cities;

  const RegisterGetCitiesSuccess({required this.cities});
}
