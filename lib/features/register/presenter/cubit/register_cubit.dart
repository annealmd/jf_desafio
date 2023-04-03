import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/domain.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final IGetStateUsecase stateUsecase;
  final IGetCityUsecase cityUsecase;
  RegisterCubit({required this.stateUsecase, required this.cityUsecase})
      : super(RegisterLoading());

  void getStates() async {
    var states = await stateUsecase.call();
    emit(RegisterGetStatesSuccess(states: states));
  }

  void getCities(int id) async {
    var cities = await cityUsecase.call(id: id);
    emit(RegisterGetCitiesSuccess(cities: cities));
  }
}
