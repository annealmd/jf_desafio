import 'package:jf_desafio/domain/domain.dart';

abstract class IGetCityUsecase {
  Future<CityEntity> call();
}

class GetCityUsecase implements IGetCityUsecase {
  final IGetCityRepository repo;

  GetCityUsecase({required this.repo});
  @override
  Future<CityEntity> call() async {
    return await repo.call();
  }
}
