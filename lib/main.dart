import 'package:flutter/material.dart';
import 'package:jf_desafio/features/core/theme/app_theme.dart';

import 'features/core/router/app_router.dart';
import 'features/register/infra/infra.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
