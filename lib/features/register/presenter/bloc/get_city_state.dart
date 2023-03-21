part of 'get_city_bloc.dart';

abstract class GetCityState<T> extends Equatable {
  final List<T> entityList;

  const GetCityState({required this.entityList});
  @override
  List<Object?> get props => [];
}

class GetCityInitial extends GetCityState {
  GetCityInitial() : super(entityList: []);

  @override
  List<Object?> get props => [];
}

class GetCityLoading extends GetCityState {
  GetCityLoading() : super(entityList: []);

  @override
  List<Object?> get props => [];
}

class GetCitySuccess extends GetCityState<CityEntity> {
  final List<CityEntity> cities;

  const GetCitySuccess({required this.cities}) : super(entityList: cities);

  @override
  List<Object?> get props => [cities];
}

class GetCityError extends GetCityState {
  final String message;

  GetCityError({required this.message}) : super(entityList: []);
  @override
  List<Object?> get props => [message];
}
