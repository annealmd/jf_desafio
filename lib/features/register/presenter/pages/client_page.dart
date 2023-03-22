import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../domain/domain.dart';

class ClientPage extends StatefulWidget {
  final ClientEntity client;
  const ClientPage({super.key, required this.client});

  static const routeName = '/client';

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
      child: Container(
        alignment: Alignment.center,
        padding: screenSize > 500
            ? const EdgeInsets.all(40)
            : const EdgeInsets.all(10),
        width: screenSize > 500 ? screenSize * 0.4 : screenSize * 0.9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
              child: RiveAnimation.asset(
                'assets/flares/done.riv',
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'John Doe',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              widget.client.city.name,
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              '${widget.client.state.name} - ${widget.client.state.uf}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.popAndPushNamed(context, '/');
            //     },
            //     child: const Text('Reiniciar')),
          ],
        ),
      ),
    ));
  }
}
