import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../infra/dependency_injection/dependency_injector.dart';
import '../../bloc/register_bloc.dart';

class StateDropdown extends StatefulWidget {
  const StateDropdown({super.key});

  @override
  State<StateDropdown> createState() => _StateDropdownState();
}

class _StateDropdownState extends State<StateDropdown> {
  var registerBloc = DependencyInjector().get<RegisterBloc>();

  @override
  void initState() {
    registerBloc.add(GetStateEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late int stateId;
    return BlocBuilder<RegisterBloc, RegisterState>(
      bloc: registerBloc,
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const CircularProgressIndicator();
        } else if (state is GetStateSuccess) {
          var stateList = [...(state.states.map((e) => e.name).toList())];

          return DropdownButtonFormField(
            //focusNode: doseFocusNode,
            decoration: InputDecoration(
              labelText: 'Escolha o Estado:',
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
              stateId = (state.states.firstWhere((e) => e.name == newValue)).id;
              print(stateId);

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
