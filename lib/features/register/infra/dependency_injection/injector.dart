import 'package:connectivity_plus/connectivity_plus.dart';
import '../../domain/domain.dart';
import '../../data/data.dart';
import '../../presenter/presenter.dart';
import '../infra.dart';

class Injects {
  static void init() {
    var di = DependencyInjector();

    di.register<IHttpClient>(() => HttpAdapter());

    //city
    di.register<IGetCityDatasource>(
        () => GetCityDatasource(client: di<IHttpClient>()));
    di.register<IGetCityRepository>(
        () => GetCityRepository(datasource: di<IGetCityDatasource>()));
    di.register<IGetCityUsecase>(
        () => GetCityUsecase(repo: di<IGetCityRepository>()));

    //State
    di.register<IGetStateDatasource>(
        () => GetStateDatasource(client: di<IHttpClient>()));
    di.register<IGetStateRepository>(
        () => GetStateRepository(datasource: di<IGetStateDatasource>()));
    di.register<IGetStateUsecase>(
        () => GetStateUsecase(repo: di<IGetStateRepository>()));
    //Internet
    di.register(() => Connectivity());
    //BLoC
    di.register(() => RegisterCubit(
        stateUsecase: di<IGetStateUsecase>(),
        cityUsecase: di<IGetCityUsecase>()));

    di.register(() => InternetCubit(connectivity: di<Connectivity>()));
  }
}
