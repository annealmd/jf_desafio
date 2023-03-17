import 'package:jf_desafio/domain/domain.dart';

abstract class IGetCityUsecase {
  Future<List<CityEntity>> call({required int id});
}

class GetCityUsecase implements IGetCityUsecase {
  final IGetCityRepository repo;

  GetCityUsecase({required this.repo});
  @override
  Future<List<CityEntity>> call({required int id}) async {
    return await repo.call(id: id);
  }
}
