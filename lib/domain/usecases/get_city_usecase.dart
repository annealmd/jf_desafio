import 'package:jf_desafio/domain/domain.dart';

abstract class IGetCityUsecase {
  Future<List<CityEntity>> call();
}

class GetCityUsecase implements IGetCityUsecase {
  final IGetCityRepository repo;

  GetCityUsecase({required this.repo});
  @override
  Future<List<CityEntity>> call() async {
    return await repo.call();
  }
}
