import '../entities/client_entity.dart';

abstract class IGetCityUsecase {
  Future<CityEntity> call();
}
