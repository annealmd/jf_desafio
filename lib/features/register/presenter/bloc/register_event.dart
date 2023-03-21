part of 'register_bloc.dart';

abstract class RegisterEvent {}

class GetStateEvent implements RegisterEvent {}

class GetCityEvent implements RegisterEvent {
  final int id;

  GetCityEvent({required this.id});
}
