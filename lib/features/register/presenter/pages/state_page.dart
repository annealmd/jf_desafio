import 'package:flutter/material.dart';
import '../../domain/domain.dart';
import '../../infra/infra.dart';
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
  final stateBloc = DependencyInjector().get<GetStateBloc>();

  @override
  void initState() {
    stateBloc.inputGetState.add(GetStates());
    super.initState();
  }

  @override
  void dispose() {
    stateBloc.inputGetState.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha o seu Estado'),
        centerTitle: true,
      ),
      body: StreamBuilder<GetStateState>(
          stream: stateBloc.outputGetState,
          builder: (context, snapshot) {
            if (snapshot.data is GetStateLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data is GetStateSuccess) {
              List<StateEntity> list = snapshot.data?.entityList ?? [];

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
                        return StateListTile(list: list, i);
                      },
                      separatorBuilder: (BuildContext context, _) =>
                          const Divider(),
                      itemCount: list.length),
                ),
              );
            } else {
              return const Text('Tente mais tarde');
            }
          }),
    );
  }
}
