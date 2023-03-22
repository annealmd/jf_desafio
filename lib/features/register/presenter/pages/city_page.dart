import 'package:flutter/material.dart';
import '../../domain/domain.dart';
import '../../infra/infra.dart';
import '../presenter.dart';

class CityPage extends StatefulWidget {
  static const routeName = '/city';
  final StateEntity clientState;

  const CityPage({super.key, required this.clientState});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
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
    late CityEntity clientCity;
    late ClientEntity client;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha a sua Cidade'),
        centerTitle: true,
      ),
      body: StreamBuilder<GetCityState>(
          stream: cityBloc.outputRegister,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data is GetCityLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data is GetCitySuccess) {
              List<CityEntity> list =
                  (snapshot.data?.entityList) as List<CityEntity>;

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
                          splashColor: Colors.green,
                          hoverColor: const Color.fromARGB(255, 235, 235, 128),
                          tileColor: (i % 2 == 0)
                              ? const Color.fromARGB(255, 246, 246, 245)
                              : const Color.fromARGB(197, 213, 225, 242),
                          title: Text(list[i].name),
                          onTap: () {
                            clientCity = CityEntity(
                              name: list[i].name,
                            );

                            client = ClientEntity(
                                state: widget.clientState, city: clientCity);
                            DialogBox<ClientEntity>(
                                    context: context,
                                    route: ClientPage.routeName,
                                    name: clientCity.name,
                                    item: client)
                                .call(context);
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
}
