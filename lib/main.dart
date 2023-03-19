import 'package:flutter/material.dart';
import 'package:jf_desafio/features/register/infra/dependency_injection/injector.dart';

import 'features/register/presenter/pages/homepage.dart';

void main() {
  Injects.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
