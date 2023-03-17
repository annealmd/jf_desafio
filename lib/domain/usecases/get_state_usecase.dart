import 'package:jf_desafio/domain/domain.dart';

abstract class IGetStateUsecase {
  Future<StateEntity> call();
}

class GetStateUsecase implements IGetStateUsecase {
  final IGetStateRepository repo;

  GetStateUsecase({required this.repo});
  @override
  Future<StateEntity> call() async {
    return await repo.call();
  }
}
