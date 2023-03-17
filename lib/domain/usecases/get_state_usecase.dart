import '../entities/client_entity.dart';

abstract class IGetStateUsecase {
  Future<StateEntity> call();
}
