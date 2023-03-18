
import '../../domain/domain.dart';
import '../data.dart';

class GetStateRepository implements IGetStateRepository {
  final IGetStateDatasource datasource;

  GetStateRepository({required this.datasource});
  @override
  Future<List<StateEntity>> call() {
    return datasource.call();
  }
}