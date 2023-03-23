
part of 'get_state_bloc.dart';

abstract class GetStateState extends Equatable {
  final List<StateEntity> entityList;

  const GetStateState({required this.entityList});
  @override
  List<Object?> get props => [];
}

class GetStateLoading extends GetStateState {
  GetStateLoading() : super(entityList: []);

  @override
  List<Object?> get props => [];
}

class GetStateSuccess extends GetStateState {
  final List<StateEntity> states;

  const GetStateSuccess({required this.states}) : super(entityList: states);

  @override
  List<Object?> get props => [states];
}

class GetStateError extends GetStateState {
  final String message;

  GetStateError({required this.message}) : super(entityList: []);
  @override
  List<Object?> get props => [message];
}
