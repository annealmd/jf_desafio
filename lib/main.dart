import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jf_desafio/core/theme/app_theme.dart';
import 'core/router/app_router.dart';
import 'features/register/infra/infra.dart';
import 'features/register/presenter/presenter.dart';

void main() {
  Injects.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(
          create: (context) => DependencyInjector().get<RegisterCubit>(),
        ),
        BlocProvider<InternetCubit>(
          create: (context) => DependencyInjector().get<InternetCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'JF_desafio',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
