import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/domain.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final IGetStateUsecase stateUsecase;
  final IGetCityUsecase cityUsecase;
  RegisterCubit({required this.stateUsecase, required this.cityUsecase})
      : super(RegisterLoading());

  Future<void> getStates() async {
    try {
      var states = await stateUsecase.call();
      emit(RegisterGetStatesSuccess(states: states));
    } on Exception catch (e) {
      emit(RegisterError(message: "Falha no servidor \n $e"));
    }
  }

  Future<void> getCities(int id) async {
    try {
      var cities = await cityUsecase.call(id: id);
      emit(RegisterGetCitiesSuccess(cities: cities));
    } on Exception catch (e) {
      emit(RegisterError(message: "Falha no servidor \n $e"));
    }
  }
}
