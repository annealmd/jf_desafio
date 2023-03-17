import 'package:jf_desafio/domain/entities/client_entity.dart';

abstract class IGetStateRepository {
  Future<StateEntity> call();
}
