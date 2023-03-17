import '../../domain/domain.dart';
import '../data.dart';

class GetCityRepository implements IGetCityRepository {
  final IGetCityDatasource datasource;

  GetCityRepository({required this.datasource});

  @override
  Future<List<CityEntity>> call({required int id}) {
    return datasource.call(id: id);
  }
}
