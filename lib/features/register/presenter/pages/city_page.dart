import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import '../presenter.dart';

class CityPage extends StatefulWidget {
  static const routeName = '/city';
  final StateEntity clientState;

  const CityPage({super.key, required this.clientState});

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  Future<void> fetchCities() async {
    context.read<RegisterCubit>().getCities(widget.clientState.id);
  }

  @override
  void initState() {
    fetchCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    late List<CityEntity> listCities;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha a sua Cidade'),
        centerTitle: true,
      ),
      body: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          
          if (state is RegisterLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RegisterGetCitiesSuccess) {
            listCities = state.cities;
            return Container(
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
                    return CityListTile(i,
                        list: listCities, clientState: widget.clientState);
                  },
                  separatorBuilder: (BuildContext context, _) =>
                      const Divider(),
                  itemCount: listCities.length),
            );
          } else if (state is RegisterError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return const SizedBox(
            );
          }
        },
      ),
    );
  }
}
