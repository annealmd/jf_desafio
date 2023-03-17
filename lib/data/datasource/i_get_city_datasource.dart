import '../data.dart';

abstract class IGetCityDatasource {
  Future<List<CityModel>> call();
}
