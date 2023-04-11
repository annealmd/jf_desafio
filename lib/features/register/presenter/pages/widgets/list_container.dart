import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../presenter.dart';
import 'widgets.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({
    super.key,
    required this.screenSize,
    required this.listStates,
  });

  final double screenSize;
  final List<StateEntity> listStates;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: screenSize > 500 ? const Color.fromARGB(197, 246, 246, 245) : null,
      alignment: Alignment.center,
      padding: screenSize > 500
          ? const EdgeInsets.all(40)
          : const EdgeInsets.all(10),
      width: screenSize > 500 ? screenSize * 0.4 : screenSize * 0.9,
      child: ListView.separated(
          itemBuilder: (_, i) {
            return StateListTile(list: listStates, i);
          },
          separatorBuilder: (BuildContext context, _) => const Divider(),
          itemCount: listStates.length),
    );
  }
}

class CityContainer extends StatelessWidget {
  const CityContainer({
    super.key,
    required this.screenSize,
    required this.listCities,
    required this.clientState,
  });

  final double screenSize;
  final List<CityEntity> listCities;
  final StateEntity clientState;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: screenSize > 500 ? const Color.fromARGB(197, 246, 246, 245) : null,
      alignment: Alignment.center,
      padding: screenSize > 500
          ? const EdgeInsets.all(40)
          : const EdgeInsets.all(10),
      width: screenSize > 500 ? screenSize * 0.4 : screenSize * 90,
      child: ListView.separated(
          itemBuilder: (_, i) {
            return CityListTile(i, list: listCities, clientState: clientState);
          },
          separatorBuilder: (BuildContext context, _) => const Divider(),
          itemCount: listCities.length),
    );
  }
}
