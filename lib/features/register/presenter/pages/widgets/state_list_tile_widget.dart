import 'package:flutter/material.dart';

import '../../../domain/domain.dart';
import '../../presenter.dart';

// ignore: must_be_immutable
class StateListTile extends StatelessWidget {
   StateListTile(this.i,{
    super.key,
    required this.list,
  });

  final List<StateEntity> list;
  int i;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: Colors.green,
      hoverColor: const Color.fromARGB(255, 235, 235, 128),
      tileColor: (i % 2 == 0)
          ? const Color.fromARGB(255, 246, 246, 245)
          : const Color.fromARGB(197, 213, 225, 242),
      leading: Text(list[i].uf),
      title: Text(list[i].name),
      onTap: () {
        var stateClient = StateEntity(
          id: list[i].id,
          name: list[i].name,
          uf: list[i].uf,
        );
        DialogBox<StateEntity>(
                context: context,
                route: CityPage.routeName,
                name: stateClient.name,
                item: stateClient)
            .call(context);
      },
    );
  }
}
