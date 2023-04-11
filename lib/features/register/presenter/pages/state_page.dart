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
  void dispose() {
    context.read<InternetCubit>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    List<StateEntity> listStates = [];
    context.read<RegisterCubit>().getStates();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha o seu Estado'),
        centerTitle: true,
      ),
      body: Center(
        child: Builder(
          builder: (BuildContext context) {
            var internetState = context.watch<InternetCubit>().state;
            var registerState = context.watch<RegisterCubit>().state;
            if (registerState is RegisterLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (internetState is InternetDisconnected) {
              return const Center(
                child: Text("Internet Disconected"),
              );
            } else if (registerState is RegisterError &&
                internetState is InternetConnected) {
              context.read<RegisterCubit>().getStates();
              return Center(
                child: Text(registerState.message),
              );
            } else if (registerState is RegisterError) {
              return Center(
                child: Text(registerState.message),
              );
            } else if (registerState is RegisterGetStatesSuccess) {
              listStates = registerState.states;
              return ListContainer(
                  screenSize: screenSize, listStates: listStates);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
