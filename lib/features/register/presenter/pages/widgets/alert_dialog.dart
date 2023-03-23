import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class DialogBox<T> {
  final BuildContext context;
  final String route;
  final String name;
  final T item;

  DialogBox(
      {required this.context,
      required this.route,
      required this.name,
      required this.item});

  Future<String?> call(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title:
            item is StateEntity ? const Text('Estado') : const Text('Cidade'),
        content: Text(name),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, route, arguments: item);
            },
            child: const Text('Confirmar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
        ],
      ),
    );
  }
}
