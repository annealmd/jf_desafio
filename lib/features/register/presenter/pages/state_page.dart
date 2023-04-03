import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import '../presenter.dart';

class StatePage extends StatefulWidget {
  const StatePage({
    super.key,
  });

  static const routeName = '/GetState';

  @override
  State<StatePage> createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  @override
  void initState() {
    context.read<RegisterCubit>().getStates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    late List<StateEntity> listStates;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha o seu Estado'),
        centerTitle: true,
      ),
      body:
          BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
        if (state is RegisterLoading) {
          return const CircularProgressIndicator();
        } else if (state is RegisterGetStatesSuccess) {
          listStates = state.states;
          return Center(
            child: Container(
              color: screenSize > 500
                  ? const Color.fromARGB(197, 246, 246, 245)
                  : null,
              alignment: Alignment.center,
              padding: screenSize > 500
                  ? const EdgeInsets.all(40)
                  : const EdgeInsets.all(10),
              width: screenSize > 500 ? screenSize * 0.4 : screenSize * 0.9,
              child: ListView.separated(
                  itemBuilder: (_, i) {
                    return StateListTile(list: listStates, i);
                  },
                  separatorBuilder: (BuildContext context, _) =>
                      const Divider(),
                  itemCount: listStates.length),
            ),
          );
        }
        return const Center(
          child: Text('Internet not connected'),
        );
      }),
    );
  }
}
