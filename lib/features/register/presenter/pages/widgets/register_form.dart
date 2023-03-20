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
  late CityEntity cityClient;
  late StateEntity stateClient;
  @override
  Widget build(BuildContext context) {
    context.read<RegisterBloc>().add(GetStateEvent());

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<RegisterBloc, RegisterState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is RegisterLoading) {
              return const CircularProgressIndicator();
            } else if (state is RegisterError) {
              return const Text('Erro');
            } else if (state is GetStateSuccess || state is GetCitySuccess) {
              return Form(
                child: Column(
                  children: [
                    StateDropdown(
                      stateEntityList: state.statesList,
                      onChanged: (String? newValue) {
                        stateClient = (state.statesList
                            .firstWhere((e) => e.name == newValue));
                        print(stateClient.id);

                        setState(() {
                          String dropDownValue = newValue!;
                          context
                              .read<RegisterBloc>()
                              .add(GetCityEvent(id: stateClient.id));
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    CityDropdown(
                        cityEntityList: state.citiesList,
                        onChanged: (String? newValue) {
                          cityClient = (state.citiesList
                              .firstWhere((e) => e.name == newValue));
                          print(cityClient.name);

                          setState(() {
                            String dropdownValue1 = newValue!;
                          });
                        }),
                  ],
                ),
              );
            } else {
              print(state.runtimeType);
              return const Text(' print');
            }
          },
        ),
      ],
    );
  }
}
