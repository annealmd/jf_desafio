import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../infra/infra.dart';
import '../../presenter.dart';

class CityDropdown extends StatefulWidget {
  const CityDropdown({super.key});

  @override
  State<CityDropdown> createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown> {
  var registerBloc = DependencyInjector().get<RegisterBloc>();

  @override
  void initState() {
    registerBloc.add(GetCityEvent(id: 31));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      bloc: registerBloc,
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const CircularProgressIndicator();
        } else if (state is GetCitySuccess) {
          var stateList = [...(state.cities.map((e) => e.name).toList())];

          return DropdownButtonFormField(
            //focusNode: doseFocusNode,
            decoration: InputDecoration(
              labelText: 'Escolha sua Cidade:',
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              hintText: 'Selecione',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            icon:
                Icon(Icons.arrow_drop_down, color: Colors.green[700], size: 40),

            items: stateList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // This is called when the user selects an item.
              // stateId = (state.states.firstWhere((e) => e.name == newValue)).id;
              // print(stateId);

              setState(() {
                String _dropdownValue = newValue!;
              });
            },
          );
        } else {
          return const Text('tá osso');
        }
      },
    );
  }
}
