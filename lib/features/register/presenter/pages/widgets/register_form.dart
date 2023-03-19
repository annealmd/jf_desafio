import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jf_desafio/features/register/domain/domain.dart';
import '../../../infra/infra.dart';
import '../../presenter.dart';
import 'state_dropdown.dart';

import 'city_dropdown.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  var registerBloc = DependencyInjector().get<RegisterBloc>();

  @override
  Widget build(BuildContext context) {
    registerBloc.add(GetStateEvent());
    late CityEntity cityClient;
    late StateEntity stateClient;
    return BlocBuilder<RegisterBloc, RegisterState>(
      bloc: registerBloc,
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const CircularProgressIndicator();
        } else if (state is RegisterError) {
          return const Text('Erro');
        } else if (state is GetStateSuccess) {
          return Form(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StateDropdown(
                    stateEntityList: state.states,
                    onChanged: (String? newValue) {
                      stateClient =
                          (state.states.firstWhere((e) => e.name == newValue));
                      print(stateClient.id);
                      registerBloc.add(GetCityEvent(id: stateClient.id));

                      setState(() {
                        String _dropdownValue = newValue!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Text(stateClient.name),

                  // if(state is GetCitySuccess){

                  //}
                ]),
          );
        } else if (state is GetCitySuccess) {
          return CityDropdown(
            cityEntityList: state.cities,
            onChanged: (String? newValue) {
              cityClient = (state.cities.firstWhere((e) => e.name == newValue));
              print(cityClient.name);

              setState(() {
                String _dropdownValue = newValue!;
              });
            },
          );
        } else {
          return const Text(' print');
        }
      },
    );
  }
}
