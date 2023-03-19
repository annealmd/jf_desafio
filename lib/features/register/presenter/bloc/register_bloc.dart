import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:jf_desafio/features/register/domain/domain.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final IGetCityUsecase cityUsecase;
  final IGetStateUsecase stateUsecase;

  RegisterBloc({
    required this.cityUsecase,
    required this.stateUsecase,
  }) : super(RegisterInitial()) {
    on<GetStateEvent>((event, emit) async {
      emit(RegisterLoading());
      emit(GetStateSuccess(states: await stateUsecase.call()));
    });
    on<GetCityEvent>((event, emit) async {
      emit(RegisterLoading());
      emit(GetCitySuccess(cities: await cityUsecase.call(id: event.id)));
    });
  }
}
