import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infra/infra.dart';
import '../presenter.dart';
import 'widgets/register_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          child: ElevatedButton(
            child: const Text('press the button'),
            onPressed: () {
              //Navigator.popAndPushNamed(context, RegisterForm.routeName);
            },
          ),
        ),
      ),
    );
  }
}
