import 'package:flutter/material.dart';
import '../../domain/domain.dart';
import '../../infra/infra.dart';
import '../presenter.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerBloc = DependencyInjector().get<RegisterBloc>();

  @override
  void initState() {
    registerBloc.inputRegister.add(GetStateEvent());
    super.initState();
  }

  @override
  void dispose() {
    registerBloc.inputRegister.close();
    super.dispose();
  }

  late StateEntity stateClient;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha o seu Estado'),
        centerTitle: true,
      ),
      body: StreamBuilder<RegisterState>(
          stream: registerBloc.outputRegister,
          builder: (context, state) {
            if (state.data is RegisterLoading) {
              return const CircularProgressIndicator();
            } else if (state.data is GetStateSuccess) {
              List<StateEntity> list =
                  (state.data?.entityList) as List<StateEntity>;

              return Center(
                child: Container(
                  color: screenSize > 500
                      ? const Color.fromARGB(197, 246, 246, 245)
                      : null,
                  alignment: Alignment.center,
                  padding: screenSize > 500
                      ? const EdgeInsets.all(40)
                      : const EdgeInsets.all(10),
                  width: screenSize > 500 ? screenSize * 0.4 : screenSize * 90,
                  child: ListView.separated(
                      itemBuilder: (_, i) {
                        return ListTile(
                          hoverColor: const Color.fromARGB(255, 235, 235, 128),
                          tileColor: (i % 2 == 0)
                              ? const Color.fromARGB(255, 246, 246, 245)
                              : const Color.fromARGB(197, 213, 225, 242),
                          leading: Text(list[i].uf),
                          title: Text(list[i].name),
                          onTap: () {
                            stateClient = StateEntity(
                              id: list[i].id,
                              name: list[i].name,
                              uf: list[i].uf,
                            );
                            showAlertDialog(
                                context, stateClient.name, stateClient);
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, _) =>
                          const Divider(),
                      itemCount: list.length),
                ),
              );
            } else {
              return const Text('error');
            }
          }),
    );
  }

  showAlertDialog(
      BuildContext context, String estado, StateEntity? clientState) {
    Widget okButton = ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();

        Navigator.popAndPushNamed(context, CityForm.routeName,
            arguments: clientState);
      },
      child: const Text('Correto'),
    );
    Widget cancelButton = ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text('Cancelar'),
    );

    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: const Text("Confirma"),
      content: Text(estado),
      actions: [
        okButton,
        cancelButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
