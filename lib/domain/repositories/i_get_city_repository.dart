import '../entities/client_entity.dart';

abstract class IGetCityRepository {
  Future<CityEntity> call();
}
