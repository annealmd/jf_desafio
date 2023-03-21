import 'package:flutter/material.dart';
import '../../domain/domain.dart';
import '../../infra/infra.dart';
import '../presenter.dart';

class CityForm extends StatefulWidget {
  static const routeName = '/city';
  final StateEntity clientState;

  const CityForm({super.key, required this.clientState});

  @override
  State<CityForm> createState() => _CityFormState();
}

class _CityFormState extends State<CityForm> {
  final cityBloc = DependencyInjector().get<GetCityBloc>();
  @override
  void initState() {
    cityBloc.inputRegister.add(GetCities(id: widget.clientState.id));
    super.initState();
  }

  @override
  void dispose() {
    cityBloc.inputRegister.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    late CityEntity cityClient;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha a sua Cidade'),
        centerTitle: true,
      ),
      body: StreamBuilder<GetCityState>(
          stream: cityBloc.outputRegister,
          builder: (context, state) {
            if (state.data is GetCityLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.data is GetCitySuccess) {
              List<CityEntity> list =
                  (state.data?.entityList) as List<CityEntity>;

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
                          title: Text(list[i].name),
                          onTap: () {
                            cityClient = CityEntity(
                              name: list[i].name,
                            );
                            showAlertDialog(
                                context, cityClient, widget.clientState);
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
      BuildContext context, CityEntity cityClient, StateEntity stateClient) {
    Widget okButton = ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
        Navigator.popAndPushNamed(
          context,
          ClientPage.routeName,
          arguments: ClientEntity(city: cityClient, state: stateClient),
        );
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
      content: Text('${cityClient.name} - ${stateClient.uf}'),
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