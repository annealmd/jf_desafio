// ignore: must_be_immutable
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../presenter.dart';

// ignore: must_be_immutable
class CityListTile extends StatelessWidget {
  CityListTile(
    this.i, {
    super.key,
    required this.list,
    required this.clientState,
  });

  final List<CityEntity> list;
  final StateEntity clientState;
  int i;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: (i % 2 == 0)
          ? const Color.fromARGB(255, 246, 246, 245)
          : const Color.fromARGB(197, 213, 225, 242),
      title: Text(list[i].name),
      onTap: () {
        var clientCity = CityEntity(
          name: list[i].name,
        );

        var client = ClientEntity(state: clientState, city: clientCity);
        DialogBox<ClientEntity>(
                context: context,
                route: ClientPage.routeName,
                name: clientCity.name,
                item: client)
            .call(context);
      },
    );
  }
}
