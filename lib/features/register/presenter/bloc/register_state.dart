part of 'register_bloc.dart';

abstract class RegisterState<T> extends Equatable {
  final List<T> entityList;

  const RegisterState({required this.entityList});
  @override
  List<Object?> get props => [];
}

class RegisterLoading extends RegisterState {
  RegisterLoading() : super(entityList: []);

  @override
  List<Object?> get props => [];
}

class GetStateSuccess extends RegisterState<StateEntity> {
  final List<StateEntity> states;

  const GetStateSuccess({required this.states}) : super(entityList: states);

  @override
  List<Object?> get props => [states];
}

class RegisterError extends RegisterState {
  final String message;

  RegisterError({required this.message}) : super(entityList: []);
  @override
  List<Object?> get props => [message];
}
