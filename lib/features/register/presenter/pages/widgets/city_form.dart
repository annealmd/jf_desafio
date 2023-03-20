import 'package:flutter/material.dart';
import '../../../domain/domain.dart';
import '../../../infra/infra.dart';
import '../../bloc/get_city_bloc.dart';
import '../../bloc/register_bloc.dart';

class CityForm extends StatefulWidget {
  static const routeName = '/city';
  final int id;

  const CityForm({super.key, required this.id});

  @override
  State<CityForm> createState() => _CityFormState();
}

class _CityFormState extends State<CityForm> {
  final cityBloc = DependencyInjector().get<GetCityBloc>();
  @override
  void initState() {
    cityBloc.inputRegister.add(GetCities(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late CityEntity cityClient;
    return Scaffold(
      body: StreamBuilder<GetCityState>(
          stream: cityBloc.outputRegister,
          builder: (context, state) {
            if (state.data is RegisterLoading) {
              return const CircularProgressIndicator();
            } else if (state.data is GetCitySuccess) {
              List<CityEntity> list =
                  (state.data?.entityList) as List<CityEntity>;

              return ListView.separated(
                  itemBuilder: (_, i) {
                    return ListTile(
                      title: Text(list[i].name),
                      onTap: () {
                        cityClient = CityEntity(
                          name: list[i].name,
                        );
                        showAlertDialog(context, cityClient.name);
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

  showAlertDialog(BuildContext context, String city) {
    Widget okButton = ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
        //Navigator.popAndPushNamed(context, CityForm.CityForm.routeName, arguments: id);
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
      content: Text(city),
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
