import '../data.dart';

abstract class IGetStateDatasource {
  Future<List<StateModel>> call();
}
