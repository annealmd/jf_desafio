import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class ClientPage extends StatelessWidget {
  final ClientEntity client;
  const ClientPage({super.key, required this.client});

  static const routeName = '/client';

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          color: screenSize > 500
              ? const Color.fromARGB(197, 214, 214, 212)
              : null,
          alignment: Alignment.center,
          padding: screenSize > 500
              ? const EdgeInsets.all(40)
              : const EdgeInsets.all(10),
          width: screenSize > 500 ? screenSize * 0.4 : screenSize * 90,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('John Doe'),
                Text(client.city.name),
                Text('${client.state.name} - ${client.state.uf}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
