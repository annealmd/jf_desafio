import 'package:jf_desafio/features/register/domain/entities/client_entity.dart';

abstract class IGetStateRepository {
  Future<List<StateEntity>> call();
}
