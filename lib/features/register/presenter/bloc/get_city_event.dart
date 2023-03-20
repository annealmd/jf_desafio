part of 'get_city_bloc.dart';

abstract class GetCityEvent {
  const GetCityEvent();
}

class GetCities implements GetCityEvent {
  final int id;

  GetCities({required this.id});
}
