import 'package:jf_desafio/features/register/domain/domain.dart';

abstract class IGetStateUsecase {
  Future<List<StateEntity>> call();
}

class GetStateUsecase implements IGetStateUsecase {
  final IGetStateRepository repo;

  GetStateUsecase({required this.repo});
  @override
  Future<List<StateEntity>> call() async {
    return await repo.call();
  }
}
