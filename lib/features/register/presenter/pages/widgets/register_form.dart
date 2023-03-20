import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jf_desafio/features/register/domain/domain.dart';
import 'package:jf_desafio/features/register/presenter/pages/widgets/city_form.dart';
import '../../../infra/infra.dart';
import '../../presenter.dart';

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
    return Scaffold(
      body: StreamBuilder<RegisterState>(
          stream: registerBloc.outputRegister,
          builder: (context, state) {
            if (state.data is RegisterLoading) {
              return const CircularProgressIndicator();
            } else if (state.data is GetStateSuccess) {
              List<StateEntity> list =
                  (state.data?.entityList) as List<StateEntity>;

              return ListView.separated(
                  itemBuilder: (_, i) {
                    return ListTile(
                      leading: Text(list[i].uf),
                      title: Text(list[i].name),
                      onTap: () {
                        stateClient = StateEntity(
                          id: list[i].id,
                          name: list[i].name,
                          uf: list[i].uf,
                        );
                        showAlertDialog(
                            context, stateClient.name, stateClient.id);
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, _) =>
                      const Divider(),
                  itemCount: list.length);
            } else {
              return const Text('error');
            }
          }),
    );
  }

  showAlertDialog(BuildContext context, String estado, int? id) {
    Widget okButton = ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();

        Navigator.popAndPushNamed(context, CityForm.routeName, arguments: id);
      },
      child: const Text('Correto'),
    );
    Widget cancelButton = ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();

        //registerBloc.inputRegister.close();
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

class cityParams {
  final int id;
  final Stream<RegisterEvent> stream;

  cityParams(this.id, this.stream);
}
