import 'package:flutter/material.dart';

import '../../register/domain/domain.dart';
import '../../register/presenter/presenter.dart';


class AppRouter {
  static const String home = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const RegisterForm(),
          // return MaterialPageRoute(
          //   builder: (_) => const HomePage(),
        );
      case ClientPage.routeName:
        final client = settings.arguments as ClientEntity;
        return MaterialPageRoute(
          builder: (_) => ClientPage(client: client),
        );
      case CityForm.routeName:
        //final id = int.parse(settings.arguments.toString());
        final clientState = settings.arguments as StateEntity;
        return MaterialPageRoute(
          builder: (_) => CityForm(clientState: clientState),
        );

      default:
        throw Exception('Route not found!');
      // could be an error page as well
    }
  }
}
